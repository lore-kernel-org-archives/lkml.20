Received: from out-2z4y-a153.jellyfish.systems (out-2z4y-a153.jellyfish.systems [198.54.127.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D59367B8A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791577840; cv=none; b=YLzTEsQQZMxswlPw5I2xJ2bDDkiqFNsiIeMNrXKEQMmKf0IYEHpbEAZBjyqRZjvP/1KjrxjYR3LW1bH8X7foRZYzWHUiAzYO2gwwya64UOmQV5hhI7oSG44VBHX6sHV181jTlIEekTvr0XZQdTVUXKu9GJZn8sKPAd6bd3nbDUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791577840; c=relaxed/simple;
	bh=g1FgcabXUwjvQAtoSiunHmHSXXnBckrY4xA79nisWq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JaJH35XO6wPG4gpF7jMPjUHBCsLXvM/shdpR8R01vdLQ+bhp3iOJyFADFH0FySzAiXLrw3us6RcvhbBPiqGVyj//DxhleMsL27GkQ+EmXbxY9vqpBdlGiZnuQ8sFlbN0Zf31ab2310aK3A70xjKbLCxoBMEPZfUgvjrU9TYnPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=catcrafts.net; spf=fail smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.127.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=catcrafts.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=catcrafts.net
Received: from mail.privateemail.com (unknown [87.215.145.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4j1dlP2PHKz8sXC;
	Fri, 09 Oct 2026 20:30:09 +0000 (UTC)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: Power down UFS during system suspend on Milos
Date: Fri,  9 Oct 2026 22:30:06 +0200
Message-ID: <20261009203006.452335-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005-milos-ufs-suspend-v1-1-a6f8b89d5b63@pm.me>
References: <20261005-milos-ufs-suspend-v1-1-a6f8b89d5b63@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: jorijnvdgraaf@catcrafts.net

On Mon, Oct 05, 2026 at 05:02:06PM +0000, Alexander Koskovich wrote:
> On Milos the UFS PHY GDSC is turned off on every system suspend and the
> PHY loses its register state, so exiting hibern8 on resume fails:
> 
> ufshcd-qcom 1d84000.ufshc: pwr ctrl cmd 0x18 with (MIBattribute 0x0, mode 0x0) failed, host upmcrs:0x5
> ufshcd-qcom 1d84000.ufshc: ufshcd_uic_hibern8_exit: hibern8 exit failed. ret = 5
> ufshcd-qcom 1d84000.ufshc: __ufshcd_wl_resume: hibern8 exit failed 5
> 
> Set no_phy_retention so the controller and device are powered down
> during system suspend and the link is brought up again on resume.

On the Fairphone (Gen. 6) which is also milos using 7.3/scsi-fixes (469fa055664b)
3 of 3 s2idle resumes fail hibern8 exit with the quoted lines above.

With the patch 5 s2idle and 10 deep suspend/resume cycles: no hibern8 exit failure
ufshcd_wl_resume 32-35 ms each, a 4 MiB fsync write succeeds after every resume.

Tested-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
