Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488E930F958
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790304241; cv=none; b=nk+5xBLbI1kBZllfrxF1/5xQaMcbKmu1PnrBsWrFOaONA4QNJFUKEorvWdJIERAmLgu+c4n2XVNGsHpgzku2FtYKHAiLr6ulXwZbt79qrT+wrTlMi2uoT3uaHUdFm2Tc98nzXlRH3rj/BFL5PWVWvxDtBp7dYHQDtAFh/+Kbm9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790304241; c=relaxed/simple;
	bh=2+C2/yDW/lCd9sFNH5wVE7e/HaICG3qrbLAnK1W/8i4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qms2YwmeDFJaLWO5sN7KMsaACvEGg9gT40bM8TemJ0sWgu1wsN7l96maXV//xGx1X1HrHrZqM5yMXPw7ojM7yG/6gS8VdFSiCacFXQLfqHXz6xPpCTFj0WT31uwNcXFQmo8Yn+rq4sLHBZ/TUcKdp98uNJtpDocSZkruUrQAFIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn; spf=pass smtp.mailfrom=kylinsec.com.cn; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: zesmtpgz7t1790304168tdb809021
X-QQ-Originating-IP: w3XVdAtjPMZd2A4bnKpct9MNG2vg7Sbf9tEaRwle0Gc=
Received: from [10.200.8.55] ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 25 Sep 2026 10:42:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 965729528590291737
EX-QQ-RecipientCnt: 9
Message-ID: <E6F9385348472E5C+1794efa3-5320-412a-ae81-cfcc4969b76a@kylinsec.com.cn>
Date: Fri, 25 Sep 2026 10:40:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] coresight: syscfg: fix deadlock on device
 registration failure
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, qinyungao@kylinsec.com.cn
References: <B16F90D29FAA2B3E+20260914074524.1694-1-dengyingchao@kylinsec.com.cn>
 <6CC680FFAC60931F+20260914074900.1711-1-dengyingchao@kylinsec.com.cn>
 <20260924162404.GN200420@e132581.arm.com>
From: yingchao deng <dengyingchao@kylinsec.com.cn>
In-Reply-To: <20260924162404.GN200420@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: Ns4vsXN8dJBsIxuMhu7o/4WgHbz7725FQkvC/bpT+bpmLQi4VqWqDDC+
	XLlGH0Txezz0QT3XZbMZj0nk+fe2pMsyh5n3oHQPDTQW67zCLAHoaQvE/YphbuLG5FqDSDx
	40vqVO9UxzMjNSesxwc/noP9509r8MDNDPNp2C/FK2OaZP7WIgAWzVT8CmORcGjOq8Wlimq
	7qhWm0Nw4G7mZjHjTAGGl7/VljrWWU8JrvrKMeEKNzb92NgQEMU5ad+WVHtIa2AdGT4gMzZ
	mHf4AeSHVKl6EDP5eI/4Mur4LnMUQzvi/4gkK6E4TxVRLS+yc+tWvacfIWXLe1lxnJWWly6
	HugMNXkEUORIb/VWMifNsB1d3Bo2+pVjgq3LuWkfSMVwa/Mm8mFEnwdK4pf15ZV06XSwxm1
	ECKc8dQWLQnhT4OwYWRTuUEV6jBs0TU2Fb3H/1OMHyGNBWLPUayWtrdxLbmHwygxNGGDS2k
	rn44XyCgXOcoZc3xP38ElerOmHmPpaDS6ryhPmr+mUU2zsrM2aZfkUBonjP2tPwQQRciLon
	RPQ76wLPMV9HLvYtY+Wd5Fwiyx18WCczQVwVYIkzv5jd/eHwv5uuXp6vcmbgKPV9mJ5Vnup
	Qy/jOUIdmHKZbsOwIwww3p3C/Hb121JHdmGef5vBz1yB2pfMNFEftdvS7CCbtQ5dvxsoGLk
	QZ8J88qa+++duD9/kDKXqbS/yuPevzN2d5Nx+V7kLT/CVJ4PG/l9vadQbrluDC9Z/3z/Sob
	/ru68IF+LN2cDRtMg2UuiDsPZJqFDFBRhrhPR2cb0JHMMlIyh0/B9yXKrL8l3QwAFxeKvcm
	BxHixVZZgCWam1HLZbn/5RzZ2PQWamu0moFPoWG6RQrJWx2EZRuzD6X2oDKRH5GPVbiCGCz
	wbYxZ+ZgEpEEtsT/Q2Ue3KlG3OFNZ9IXh5qKtfyam+oO3ZadQBGT2yH458/G83xys54iRQT
	RtMePukVMs0cpbQlXfmOdg4SMx6R008S+2xoCVTjchJyqM2i0zVUXg3J/FLNE3zeTUYmWmA
	G2/PGDt9MhtUTDXFJTuQQNNBDNuTM=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0


On 25/09/2026 00:24, Leo Yan wrote:
> For this patch:
>
> Reviewed-by: Leo Yan<leo.yan@arm.com>
>
> Sashiko reported an issue for null pointer dereference if configfs
> init fails fails [1]. It is good to fix it using a separate patch:
>
> @@ -1299,8 +1299,10 @@ int __init cscfg_init(void)
>
>          /* initialise configfs subsystem */
>          err = cscfg_configfs_init(cscfg_mgr);
> -       if (err)
> -               goto exit_err;
> +       if (err) {
> +               device_unregister(cscfg_device());
> +               return err;
> +       }
>
>          /* preload built-in configurations */
>          err = cscfg_preload(THIS_MODULE);
>
> @Yingchao, do you mind to work out a formal patch for this?
Happy to. I'll send the patch.

Thanks,
Yingchao

