Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643153;
	b=duDoIapo2ORbSft8J+2eIKRuiVYhTWRY3ABOC0oSEo3OeFV5cmnpKYjvNe99nSmrelIH
	 GIiiKng4aawkK2zmDESSNBNleU6ReNh1J32rQ1TZTxZvcgh2K6EGRs327Ng1I5EOLGxY5
	 A+X8bn9WtjMRX2YaTtBz5zClMtwrphpN+Qynl5JuMrJyqXfyvG1R3I5ZYgpjCY6OSYPl0
	 uGkLXJPc5FmfAQTj6QEHpAWqIUZDIjBH0ACQVcCevC4nCiBpbvenZs9XnPYZVjpARGNPH
	 4Vc92xEUQ43m9rRTAoRk+ej7giUKWv71yM0VDo442ZBTcEiWzphNNC251sOsOid3RzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643153;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=LGDqpmJ6xMWSEt4fKKeCFI9mYC6+/BLX/719ObqwWoU=;
	b=bPvIl2qt5q05kObnQbhSThaGfQkK02Cnp7SUJ4W9YTw9pW58zWwmKVuNZML6laqTK38g
	 K2k6ZSd00ksoKb7nCs89DTzUHvKlDVcJ5d6auoWeUTXpz1IahM/rbatn53p6sv0AENyNC
	 8zUKR2ZgEUpD3wS64vVtJkFIxXxweINSvAAS5J9idaSqtJlFldLtCkHHbH68Nybdtt1kk
	 pduZTPED0SFWqeZso1oTsZQYiYB4uRuNBcpJYOurPXxGOkzsaJy2/uvVVmSsMkwn14zdj
	 NZR8mR+zrRcbciiQ/42N9WgleU7q9iFHi5iFkCdSWDWJRF+PHLf9a07wFHfnBnlW++A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Z9TrVRhu;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B036606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B036606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Z9TrVRhu
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85F411C14;
	Mon,  2 Nov 2026 10:12:28 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 425EE3F673;
	Mon,  2 Nov 2026 10:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793643151; bh=PEmx+V2MAM21COP+WbP5EuonNJZriByNK+30+1vniBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z9TrVRhuq4bQgVF5QIDinF8dpMs6YFPKusukuImTTwaWW2aN1ka19Mk4oQ5HGF0+Y
	 B1X74fFMaJir7xpDh7Vf2lDFUuYzTPjkiVPoFIePsV7Jnukw4MHOc1CDK90K3GWY76
	 W2iKkaus4x/0VPVnOGMfBnfUWeAYvLG5DVZRzILQ=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	coresight@lists.linaro.org,
	Danilo Krummrich <dakr@kernel.org>,
	Mike Leach <mike.leach@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH v6] coresight: coresight.h: add '*' to kernel-doc lines
Date: Mon,  2 Nov 2026 18:12:20 +0000
Message-ID: <179364309003.3015045.6629658616372462251.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102175751.2274430-1-rdunlap@infradead.org>
References: <20261102175751.2274430-1-rdunlap@infradead.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 02 Nov 2026 09:57:51 -0800, Randy Dunlap wrote:
> kernel-doc reports 2 (kernel-doc) lines in coresight.h that don't have
> a beginning '*' in them, so fix these lines.
> 
> Also convert struct coresight_trace_id_map to kernel-doc format to
> remove another warning.
> 
> Warning: include/linux/coresight.h:173 bad line:
>   connected to @src_port. NULL until the device is created
> Warning: include/linux/coresight.h:177 bad line:
>   needs to be filtered.
> Warning: include/linux/coresight.h:236 This comment starts with '/**',
>   but isn't a kernel-doc comment.
> 
> [...]

Applied, thanks!

[1/1] coresight: coresight.h: add '*' to kernel-doc lines
      https://git.kernel.org/coresight/c/02ab6256e4f5

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
