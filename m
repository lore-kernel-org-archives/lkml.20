Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E85B366055
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481661; cv=none; b=hF7mJ2Q5sHrXAceTEVBfBZzrYJcKoQ1MjMtbMLeUz12+F3zJSrhClT/fkrdGXtZeRaWjUsw1dbjK8Q4fQiaVBpHvQe7pL5rEQZETYs2HJABRs0+Hnq0Yb7V0v7abhjKaTWvx0/xRdgohPXyF2hgEF9a9q8LuDmV/E41iWSAtPt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481661; c=relaxed/simple;
	bh=iNWIDSvHpFNxGexdLSJpqdQuUlKHbAxotg8LVmPw9Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WhukdwevZ8iPDcNr/eDs1akWa/EXiRWJw2ZpK9bduqn4QVa9xUawp6TocJDvHJUGjGy0l90ePOKQOwbVSs1KLkwoFHSATMGnu2+YWKk7HTiCLgYOsaetMHf/1roMbn4KLMeBzeG8T6jZQbDuE560+BHhoxTBimiqdvQ0sgazCjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dUcMzsy7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dUcMzsy7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1908C1F00893;
	Tue, 15 Sep 2026 14:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789481658;
	bh=jNENJb5/uy9j+GjflFgbEMSVLzG3vVpVhOOfx8QtyxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dUcMzsy7aw7q8AZK9gfKy9qsDrAg8ZOAtNeaPer4/3gYD+KNEY+xZu56acWZyy7G/
	 W02ST8yO1Q22p535M0v7ZYguGT/u4GM9kMnRniOvZ0Mg6Pn4gA7/jmuXdRCDVkn+L6
	 WhC16INupxTUlCpLPQOz2/i7SJc1HuZK8RxDiVHPA/qdfOHbEnc41RwTLgr5SQv6Sj
	 4Ym8UbxmnWaUeY5GJQpU6zZus02YlcCL8IeSc9HSylzw+6k1eAbql2ca99Z89lyfKr
	 qQIgZH7xoqC2oiEpo4O8M97FkTYlszFRMbO3eeoE3jN+gzozHRYhM3820iGEyqPi0n
	 /njpbusHQWLyA==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org,
	mpenttil@redhat.com
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tests: hdmi: fix infoframes tests
Date: Tue, 15 Sep 2026 16:14:00 +0200
Message-ID: <178948162528.1987579.17248782054753924983.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914040723.2593700-1-mpenttil@redhat.com>
References: <20260914040723.2593700-1-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 14 Sep 2026 07:07:23 +0300, mpenttil@redhat.com wrote:
> drm_atomic_commit() calls drm_atomic_check_only() internally. Calling
> drm_atomic_check_only() explicitly before the commit leaves the state
> marked as checked and triggers drm_WARN_ON(state->checked) when the
> commit checks the state again.
> 
> Remove the redundant explicit checks.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next)

[1/1] drm/tests: hdmi: fix infoframes tests
      commit: d5c34a384305e05a2d463dd2094e0ec449643bd4

Thanks!
Maxime
