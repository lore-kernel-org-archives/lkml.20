Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1646F4534BB;
	Fri,  2 Oct 2026 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939880; cv=none; b=MONz2c9TkUA/Cymh7qdSMeGsIYmD8g9+o0xLTHGHP+fvcHpfAZcNkq3/kA8lkU9loXLFHQizBP+764qp26DlMOyYXXsSaUHpAc1wK9PV+BnwrSawYa1v4ym0tTa53jxUJX8a3Qhgmjj28qoM3OTvUuN9YNqZ9vMcYIHUzrB5DRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939880; c=relaxed/simple;
	bh=Zfh+lB4OvtpXshyFNYZ5iHxy1OHs8AeIAmkFrDro2jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I06UfDDByb1jhTnwzobYufejRHUGcbGAvgMEwe8q8/grqTxlekgHBYbJ06xucBkYKS+WW2CvAVJnQpLJpZAZBeQJnCXbwIB2beEZ/G1co5coh169OJGoY6Ata+WXI+WPjPYL15yE1dabsK0oRZVnxS8ET1pg3jePy5Y2y6MBqlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gBGK8flE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gBGK8flE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74941F000FF;
	Fri,  2 Oct 2026 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790939878;
	bh=JoS0lu77ACM7EGZYfr0kwWSZE74B8H61/wxMEgqga4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gBGK8flELtRFW+JD2WB7fDL/jjkXp7bxqBAIOFTnNm5vpXJ8pI0Gq0Kui9mh2UXYL
	 lmSPW/+mXVE0wU+4R5dhSOmOT4WkYJs1DcSb1b6+4IhmM8ELJ5Iuj3K0YTm59EoPz9
	 jddiLy+9CD+b14TGD9lKHnrKjFUTKXpYc2JFmz4hN3JCkW+ZTGy/y4sRMXejc8t6sF
	 qPDOEaC5IKNVGXS5SFK+Frx9GAcxTapzJlqUW55nBjHFfBeo/w772979hFIFGg6Vw9
	 gYjb53kVz5OZw7ZqfUEivHAHl2uowuWy+J0Ro6S2MjqFfphjNT0lEnJQChLKLaTB9J
	 39NStPPAL/mjg==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jennifer Berringer <jberring@redhat.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>
Subject: Re: (subset) [PATCH 0/4] riscv: dts: spacemit: Enable USB and PCIe for K3 CoM260
Date: Fri,  2 Oct 2026 11:17:49 +0000
Message-ID: <179093925279.1231617.4093474428218095835.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 28 Sep 2026 19:18:03 -0400, Jennifer Berringer wrote:
> This patchset enables USB 2.0, USB 3.0, PCIe, and rfkill for the K3
> CoM260 Dev Kit board. This board has 4x USB 3.0 Type-A ports and three
> M.2 slots which may be used for two NVMe drives, Wi-Fi, and Bluetooth.
> 
> The USB Type-C DRD port is not enabled here because the necessary
> drivers have not yet been posted.
> 
> [...]

Applied the USB part, while leave PCIe part for now, thanks!

[1/4] riscv: dts: spacemit: k3-com260: keep dldo4 enabled
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=f314c98807c12272a1902aeda9c648d81b39bad2
[2/4] riscv: dts: spacemit: k3-com260-ifx: Add USB nodes
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=bd56cb9b84f74ef472c71285fee9e28ee414b10a
[4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=dad085951db1098a0294da7d78aca1594b0f33f7

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
