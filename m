Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F93047A0C2;
	Tue, 22 Sep 2026 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790103080; cv=none; b=NGtIVSw2Au3p/r8GbMSgTW+I+NpwcxfN7JBjChaPpGbX6/l+uWiaG+Grj2Us7KE86FeHZBpD20rju40tWiZPSGkhZ78iVjkhkwb1jzURjA72lPl4Rn13NqHVls0pFeVvVRE7HFeVXtLojhfXGXhTLt692QrfDLTHtSiYzG3LVEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790103080; c=relaxed/simple;
	bh=2dvNLO5UdKtXrnc8+xLKQ3G5H6MDPVoDzzdiqG29qb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sFKh9N3kdHWPphsk1HNmzoTKrzlLPt8eiuvLBrTYt8+1EFBjkYTUkS9BPs+7l+Hwnn6eMIjg8L6ldD7hAMmlLPydUXw38KagYQkka0K58cjx5714S73uV+8fIm6MTFRiEnlo5YUZDa3D+7uawNUiZimr1zFNNYAv3xCo9ecJTcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn; spf=pass smtp.mailfrom=tju.edu.cn; dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b=V4MNs45y; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tju.edu.cn header.i=@tju.edu.cn header.b="V4MNs45y"
Received: from tju.edu.cn (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [183.242.150.9])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4ec0d7baf;
	Wed, 23 Sep 2026 02:51:02 +0800 (GMT+08:00)
From: Yibo Tan <lhfff@tju.edu.cn>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mark Brown <broonie@kernel.org>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC: amd: Fix borrowed ACPI codec device references
Date: Wed, 23 Sep 2026 02:50:55 +0800
Message-Id: <20260922185057.954150-1-lhfff@tju.edu.cn>
In-Reply-To: <20260919121318.1613824-1-lhfff@tju.edu.cn>
References: <20260919121318.1613824-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0ca75068c03a1kunmdcb19010a0090
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSh9JVkIaHR1CS0pKHU1CSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0hVSU9JVUpOS1VCWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=V4MNs45yk0dd7Vy3svb/JjjIVjtwiiF0ciXkO8CNrr8pO5RkdH4rH1ERGKmlnATQe8PJvMDYHjiSuNzxlv5GHPii9I8WE01+dBgxJ+aN0H4fdGql5poFcXe00BF07EJ+6ic4Xhir/LU7MOx/2M3k0qGbIW6X1d0f0wBeVqGS610=; c=relaxed/relaxed; s=default; d=tju.edu.cn; v=1;
	bh=9gJDHpwJMxFSLb9dNZiKQ2wOWfAyrvj8Y5itZ4N9ffM=;
	h=date:mime-version:subject:message-id:from;

Two AMD machine drivers treat a borrowed ACPI physical device pointer as an
owned reference. The ES8336 driver drops it on a GPIO lookup failure; the
ACP3x driver drops it on an allocation failure and also stores it beyond
probe. Both paths produced a KASAN use-after-free during device unregister
in focused tests calling the production callbacks. The corresponding fixed
tests reached the same failure paths without a kernel diagnostic.

The tests did not exercise a complete sound card or physical hardware.

Changes since v1:
  - Include <acpi/acpi_bus.h> directly in patch 2 so the primary-device
    helper is declared when CONFIG_ACPI=n, as Mark Brown pointed out.
  - Patch 1 is unchanged.

The changed ACP3x object builds with W=1 with CONFIG_ACPI=y and
CONFIG_ACPI=n. The ES8336 object builds with W=1 with CONFIG_ACPI=y.

Yibo Tan (2):
  ASoC: amd: acp-es8336: Use an owned codec device reference
  ASoC: amd: acp3x-es83xx: Keep an owned codec device reference

 sound/soc/amd/acp-es8336.c                    |  5 ++---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 14 +++++++++++++-
 2 files changed, 15 insertions(+), 4 deletions(-)


base-commit: 0ed6f7f62318a581fe9698f8a4e98c7ca01160e4
-- 
2.39.5

