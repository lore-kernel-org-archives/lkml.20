Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792800597;
	b=DgTEBxK783sstcGrHl3hsNMM3ViwoOKCaMl75hNK+HBMq9G0iBquFsJc0Or2I5fhHKt0
	 pYRcVRI1qNeGh6TNDWVlUiM6WVoY350EmsbFMagEUiwsSbRg+SsdN6bYsfJbyA6bYqR4a
	 jFivoOMpOxJvFcyzH1NvNI27AiqMkU8F7uBCylhZWmEjiqn6YwlyDaDyxSCZL9e9a49l9
	 rNs3XyUxL8gFXUKXc0pqINfT1C1nx3+iJFVOyc92Z9/ukNs+m5URLi4kMsknC1xV3w+2p
	 B0D8xCpo5oSouJY+7zRGay4vNIgz2nKf5dF3Z6f6mMCUsL/2pHrv44XCqmg7w/8avvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oHnBaDBiTFLamKq5NGOdIg3Rc+UCACis/kFyJn6z/tk=;
	b=hfwbz/FPkZ6lg7yuBT3WT69gsb1F3Rb1/56HoM4jf7q9Fb6nGulrFxobpLFuPCp63AWE
	 uXtkgqLjL8DBLFFmMAi2nZBFSzFKA2il3jNbxZ3rE4IxxVW0AZLrkqQDjOx178cJJ4rmB
	 1CGS70nadRtccDU97bqrEyHW7+9gCDmWYCXAJ7oKN0BkC29Y8RtRx0+fqHlO9jmcVcFOZ
	 6ypc9pknkRTy5VhLovC7K2m5GPNhwq0133FkHXwfDpe+ZtSf6KcL+w/6k1zqzBSyOFtFJ
	 7P8saa0wEnTeSOGcmI+74MkZVak05Ubat/voqWzaInRtkDSeoHFmIKqFYOWkrtnaNwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=an5WwwQJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OW4ZL+bB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32416606A336
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32416606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=an5WwwQJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OW4ZL+bB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvNgJ372306
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oHnBaDBiTFLamKq5NGOdIg3Rc+UCACis/kFyJn6z/tk=; b=an5WwwQJwdtacYzX
	YJ8cLxGoL+zkrqCAPNMPb1Bo0l+rmin4NW2dGTwQaowfVy1NE/u8anbBNJQff6oD
	9iRQO7hAN9qqHc1egF3y/x3ZPjBYwVfQwVxRYVJ6YFoGl0MKYr3jK8b9nPkhXmLs
	KuItwHvGmLAK88dmjtMkQwQ9A+E+HZzhXWqQF8vryy3K6pARLXxxH+XzQLJ+x+r7
	ukOGjazpt0nJDkepfdt+abjQkWoOtJ6Ydgbib2b+YXAGbKLPXqV5iD8cEOdVsTyN
	vQCKf3YhQZ2fKRHPYFTx4ICxpE3XpO/wHt9uDfI0Vb+9+0uuWFb2I4K4lIDeS0Di
	MvN1wg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas89fdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:09:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so5700558eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792800595; x=1793405395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oHnBaDBiTFLamKq5NGOdIg3Rc+UCACis/kFyJn6z/tk=;
        b=OW4ZL+bBSQhax3H16xLZGHXs85h23cZYtiGm0drz7kgAsetQBOgktC2WChpbmUYCsh
         LYgeKDaJ47TjeJwGiWJYaiiHptoUdy1sbhb2wNBTkHWhzn5qL+ok8u6COijgDhSS3YPA
         4jE6sgaRsk3na85wmj8zPzejuMvQIkevoeA8pssb48xeEoU5vM3KCj9Yrgvy9D0h2yry
         d9Py7udCV3DRtvb6rkOGQc2zYFeP7IswotkcfI7QQJF5tjzuk8BdO4TcDePpF4jkMTkk
         djCAPHzYvePHadLhweOtIMA1XxxRuIc9RJ8YRTTy9/K7Vb4cMQOS0XJ2bYwb31FR+kUD
         X7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792800595; x=1793405395;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHnBaDBiTFLamKq5NGOdIg3Rc+UCACis/kFyJn6z/tk=;
        b=phCA8VtQB8spm2jI8fGHXi8yFvwRFqIBmvC/e8J5zec/zLCFeDbZK2BvBctcEm3WHb
         9kXXRcj4C+Hxfb5qwIDrgBg2KG87EJ+uLm5TcDDn/n6Cb82diA+bIa7YKu5ZxlT+fKig
         KxVwmGmNtQszgUg0alb4eQe5sJcQagjsbUjtW8x+K+VunMjIx82GvRNTfn97a2ViCrx+
         d1GCAQcc+z13pYC70tjYrwIANlFDJb89bXuUR2Wto87Zpp//qavCYFREgFoNxI2FFCWn
         YQUKD/+vt43AP5ibUrZDgxAozoNWGbndL3Q45X+r3FPhgbv8Fn6LBTJ7CWBqMg2OwiFf
         yH4g==
X-Gm-Message-State: AFq9FYK3BDIXtb6nfeVaJcpAqQz51gFNrSTyiSM4UNwm1F4okfGj3KSs
	S/KdDVJ//5QQiYFz7tfyLSo+wvO3dy9NOHbVeH+JFUgHtPFgS9Bty7y6m5QIvxB/p5sAagM92bA
	QzjUeaaAALxaYx1qRR3AFczjorXgd+fX4KmQLPa6mNEo02u8myZ1sl0OQGYgWugEmGLk=
X-Gm-Gg: AYBFou3rVu/ja/oVNF+bwaktjlVcLy9Xcimm4t6IH7x28+vGDIG/ERI7xcBRKAk9uzw
	s+5uwwuq7v3Fjli9W/9l7/KuRXda4PoZSdwYwqz272zrWuGueNnqMrWLg7cHrtR/bN5qbyTwehd
	Mth5hiWnXCy3begmaAHMGeLSlrs1L6S9eWGUyQRl0nhnbLVhDt/ahtCWWoCfvUDMMhwQr08dvjW
	/pWufMAf2fSdVkQRLJgUnZ8RHVPh6isdRDon7xPj07dCfwWTkdPtwoupU52hppiz7ZYlzfpKKju
	h94DW63/DAwOI/oHBQvcBFCvfmWCNDXgq6vKnAN6V9sT3dWtCqcAYE65uJLB5BFwnG/1OY9s0Dt
	m52RHx043TF2ywzlesmkFxKdLjw9Rg/z12RaMpsFJOZRSZxjM5QW2cFk=
X-Received: by 2002:a05:7301:1694:b0:366:eda6:8dae with SMTP id 5a478bee46e88-369e84b9a3amr1452618eec.18.1792800594790;
        Fri, 23 Oct 2026 17:09:54 -0700 (PDT)
X-Received: by 2002:a05:7301:1694:b0:366:eda6:8dae with SMTP id 5a478bee46e88-369e84b9a3amr1452555eec.18.1792800594047;
        Fri, 23 Oct 2026 17:09:54 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm1724701eec.13.2026.10.23.17.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:09:53 -0700 (PDT)
Date: Fri, 23 Oct 2026 17:09:47 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Mark
 Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov
 <bp@alien8.de>,
        Hanjun Guo <guohanjun@huawei.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Shuai Xue <xueshuai@linux.alibaba.com>,
        Maciej
 Wieczor-Retman <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M.
 De Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Breno Leitao
 <leitao@debian.org>, Dan Williams <djbw@kernel.org>,
        Terry Bowman
 <terry.bowman@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang
 <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v2 6/6] ACPI: extlog: add Memory Error Section 2 trace
 event
Message-ID: <20261023170947.00003e37@oss.qualcomm.com>
In-Reply-To: <20261019203915.2019037-7-pierre.gondois@arm.com>
References: <20261019203915.2019037-1-pierre.gondois@arm.com>
	<20261019203915.2019037-7-pierre.gondois@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMCBTYWx0ZWRfXw8MgorfiIxkb
 GWY9p1vAvTSSlEZxEKa3tpOqw4pogPLHZBJkvkngmdDkOj0d82NTtrbqqVv9AAz9d1/rYh3LH0a
 f0vkEniV7agp7WKdXnZDfXl7WD6byG8=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adbf753 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=dQPge2qhURPgFtmzFlYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMCBTYWx0ZWRfX+zbZpuDdn4Qw
 aJs7fQzkIp+8VVzCcoIKINun44pdHt6HuFeUbSm/eej2V17doyQgO2akWmSSW5plQr5pL/jWmcW
 W4EKo/aKw7Feej55H/RgkZUcGMZSAnDRHMyuFpV8eZAFRRm52m56aStyqHdj3zdh4IIXTYrwAzP
 iLnEgY1as30bp/fQpLWyafWYcuAivk/o2KDErDLjZTPl8y5GABlY2xDtD1+6s6YjG/KeFpxHXeV
 wmmBgdvQU8oN0YGzTSU/lI0Dk57PMouJxCuUQVp71W/ax3kYbEIFy+bhCtFwXd7jIWQe75FkFNP
 34oorStsLMRX9DuJLoIszveJusCwxzOPpOvfvqVyYwQ/eIIsni6I+Qx6IPybl6i6hQ+jt7/YutC
 uOwCiPLfHgrKBGrySn2T6afw7Ar5SxT9CckUE8kteETbVdLLrxkQ+tfErdUvMlt+KVQD7wO02j+
 C1vTJEijkuHf+7LQ1mA==
X-Proofpoint-GUID: R5rPS2QZ2o5Rquq4yCzfxiWQWGeOZgeR
X-Proofpoint-ORIG-GUID: R5rPS2QZ2o5Rquq4yCzfxiWQWGeOZgeR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240000

On Mon, 19 Oct 2026 22:38:45 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Add a separate handling for Memory Error Section 2 trace events.
> The fields of the record are individually printed so userspace
> can discover the layout more dynamically if a new field is added.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
> ---
>  drivers/acpi/acpi_extlog.c |   6 +++
>  drivers/ras/ras.c          |   1 +
>  include/ras/ras_event.h    | 102 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 109 insertions(+)
> 
> diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> index 7ad3b36013cc..9e4d16e06244 100644
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -231,6 +231,12 @@ static int extlog_print(struct notifier_block *nb, unsigned long val,
>  			if (gdata->error_data_length >= sizeof(*mem))
>  				trace_extlog_mem_event(mem, err_seq, fru_id, fru_text,
>  						       (u8)gdata->error_severity);
> +		} else if (guid_equal(sec_type, &CPER_SEC_PLATFORM_MEM2)) {
> +			struct cper_sec_mem_err2 *mem = acpi_hest_get_payload(gdata);
> +
> +			if (gdata->error_data_length >= sizeof(*mem))
> +				trace_extlog_mem2_event(mem, err_seq, fru_id, fru_text,
> +						      	(u8)gdata->error_severity);
Was just giving this a spin and looks like mix of tabs and spaces (with the spaces
in the middle).  Git moaned when I was applying it.

J

