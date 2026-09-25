Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449E4499B4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338817; cv=pass; b=DXx3TLY2NOP0uq4nVty7tKM5hY+RjX884S0k/JyDSFBSE3XEiLWjhOogH/duf5pY3HJeQ/g36gCig+U61kijfhnx7+O0rqRSNCMfvUp6ViJ8SRocwMkI8hl7N03TLONHek9E7Psq6WamNMn98u8T+z6CbI9WttlKw0f9pRQNwRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338817; c=relaxed/simple;
	bh=OYWgPUZC+U2Ej7pzOKkXR9bXGaI0HZOKpE5sGDIciUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bDgWQ4iOVFOkqU7NJPvgTQrLcrcpi14LEyfL9MTE9zAfqQKKxTlOTVdjwg1gn8ewppkgq4iA8eDAMZL+8XGDpeBxUCCvEdIGYtyUNl3BF99uRIpALDdQjtpNiFX1bc5wVyDAYt5VKyp8e+4FM0uGnVL6yE68d3QZkc4TgHSEfco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b+EXR7Dj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ek5VyvWw; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b+EXR7Dj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ek5VyvWw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YT2U2911652
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:20:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=; b=b+EXR7DjyDoIih8/
	HSzKykaJj5kLdewcfE5ub/xLBS6N6uqWV639I5n1FU7h3hq4l/YPrsx5JDAm1EiP
	DEOfPIOUVaNtDRle8f9tTyHGIh9caGOwqh4qKvMzFFHwZTu0gTJ9JbMKNd9QRLeh
	24hD5tTLgi9bLxQPNQkvyx3MLuPupxmEQ+IO0/Zs3FkNHRhV514ThJrRK9sdIBAe
	Lsn8ziA3yoRH51UnqRPubv7wNPdnHnexJxTwp/3rPENqzCRmEkTHw4Nb5iMvGtDP
	zl9xEmXub6aeHCKAD+4xT6O88uAW1QVNJPWsZh6PUaYFlxfUM1vp5T20swzcMz52
	NaOlpg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm51f7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:20:15 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8a86a395fcbso8621867b3.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790338814; cv=none;
        d=google.com; s=arc-20260327;
        b=RSs3O4w+xmjOvN9kOr5kcwcHwdG19mJJ/wQajh/iVHdHTG9Ll8P/+OFnStb2zNM+zp
         mKnXViyOmp1H+vkVHkhvr11d0+WyYSGl7oYwl0ona7+lq9COHljsK/Fo/qzC++U2wdsO
         y5NEQ2Mx993j9ghAOwSOoRBiDF47PeGessBljNwL3qpo6mdqngyHcW6VeyH6sPRcw7vM
         euqsa+blIK8MnGOxE2n7T0zSTxe/nR3x833ifxnbQoYwJMkKBXMjC02BW9AEoEt4h3t1
         o5ci411PseECmARCHyC2i+3AMU/1R/YKr1dZQp1jmODQ4ABokzQXh5OHWHS4/7W35J6n
         s9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=;
        fh=4wPOCbFXQvgY46W+/QFQZSU4R9rAZco4jvfasHeOYG0=;
        b=mopsANCxd62KweCbDpfBIVWcVlX642rA72zh4pyTtTSnceTSnv3xG2LKP5zTrYYnTs
         GtlV8gZhWN6gX7X5bVa8js3eX245F2o/8iyPmccmJtXpvxWwiuaQ0a/vKo+DJFK9O7BG
         6Na6CjH1XpMACG3NsGnvzqztAkewbFolXR8vlnoWbJacXdQDpooItn9byBca2AT+F0RO
         tyTENzR1bLrXCTIimzzXxheNTHeOJdcy8uMdlCjmiJGpoDreZMhtK2vp9mrFHs2mpOCP
         rCVt5ZZNXy6j7bXE+fU3HkTHam83PRyFWNe4Eh7jyNsG5WZ4HyyWyVdrFxwMOymV00WZ
         cqEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790338814; x=1790943614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=;
        b=Ek5VyvWwDvOb+d1GySmR+VXnrUrkkmXA8Jv9Op3dZ9UTjwBVbjGyc56wkpfuUCwL2J
         fTLRh8UrOmC5sVIFPYZSLlQctdevlVd9CiLoYwKRPGHi8LnCtFfRs5LUnmsXmzOlJ49H
         OOdJMYe3UL5xavUcgxA5YzdmK/nvEhr6Fc81C+/mTd7MV9gFEFxHCKIb94TPN2/Dpxl3
         Uqx23PXHl37SBl9rbXaK85ad1Ef2R4/cGnPZ/AB5aRlEVP2FJH2MRfhoHLcoNSSev/Lb
         H7ft0HkCEJjA2fdVNnd0+MqcCKzGmuGeRlR8ezPOfmpVTSRw2T1RBjLu3M4GMjzCr51V
         dizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338814; x=1790943614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voQ2O/Dzz6AWd22TDESfkLRIvWXyYSS44IiGTAccKHQ=;
        b=E5nHc8XqqDd9C5EZLYhM/tfn2XWd8eWTQgXXfXFh7TVvP1Zqj/WyX4M0ed6zKfFRdJ
         Sn5xTKLbo02/Yl/uIPkfQdDvstdu96QA8IG8de0gjxn1eVr1oLhb27Bu+KH/ugCVW95m
         gCiScuBke0dLd0nrma/62375XFeVp5pT8ims32BLy8cLftrMZPM2hG+2GPyc3TCpZ2RK
         3jxgbxZQ+kuA1TraIEp1Yfi50G0zAOV5LDKrndqaQSqEykHyRVu7lzOBMpfgFt5J0NEu
         ukKm6tIq94Wa8TNqTo70p7Su/OhBOKkgmNcYIBPcV7fS7c13DUKkrsl9wgX0DHk8IJtD
         QXQw==
X-Forwarded-Encrypted: i=1; AKwUvBz+Yq0gwlUzDLIljxeMrjDYRudbpcC5yfWBl9hu9sPiq+5bul1JZrWArOKhv8LxrhZYz2vR+H7e+aYegpY=@vger.kernel.org
X-Gm-Message-State: AFuF++mnanf2oyKb8BXIMV90UrMrOItmT+YjlYIZP+FtT46xuFJyzX4p
	sc6cjFl4cJScM1zcykkvN5yaeSYDMS/9vXjvNsmbkuZIY0TEyF/Ac6WWmP/sY1UOm28IKQT04MD
	9ZWX+IGTperOX4DAv1iy0iR+AmQj6hlTgd4OmVp4EmXjr7+iX4txDLVQUPzgJbnfqoiSlS9PBaO
	xlcpQ129VD9FGj5BL/5gjtl9WYcjAkEsGkSSptrAYo+w==
X-Gm-Gg: AYBFou212Lmzg/m43dVXq2En8flVhxsIGdi5akaumA2UiWuZYbljd10ODSHhn34y6z0
	gw9zW/rBHn5HV/UieNrXkyP1iMaZDhDhN2DbZxDCLVt8dwqo/XBaQ1fMa2u8o4SAw+qbandL6vy
	a5ECTVazhFVtVBkpoopoegIYGHa9pUAcwR/pC2+42cpaWI0K+DYZefMxg=
X-Received: by 2002:a05:690c:7011:b0:8a8:6fac:1525 with SMTP id 00721157ae682-8a86fac15dfmr9506947b3.46.1790338814083;
        Fri, 25 Sep 2026 05:20:14 -0700 (PDT)
X-Received: by 2002:a05:690c:7011:b0:8a8:6fac:1525 with SMTP id
 00721157ae682-8a86fac15dfmr9506707b3.46.1790338813586; Fri, 25 Sep 2026
 05:20:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918101113.6699-1-shf.chen@mediatek.com>
In-Reply-To: <20260918101113.6699-1-shf.chen@mediatek.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:20:02 +0200
X-Gm-Features: AclHuK-ouBDE3NP5KllgzizL8nzI00TGFeoDBfSmluIKyV7R7AT2q-LaOcyCY5Y
Message-ID: <CAGgiveUPixvTF9vJ2Xo4zTSL3OBND=FgWpNth7F6PuqcidLmVA@mail.gmail.com>
Subject: Re: [PATCH] optee: register TEE devices only once fully initialized
To: Shao-Fu Chen <shf.chen@mediatek.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        tadd.kao@mediatek.com, jarried.lin@mediatek.com,
        vince-wl.liu@mediatek.com, justin.yeh@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: YlR1hfjDwibt0wgf7ubJd_5dK8bj7CwN
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab666ff cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=mpaa-ttXAAAA:8 a=oFcAipZnX4TCZRIg_scA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX6EP4jgc+7pBe
 4LDgP+TREtFGyWMsSvTwd99hrLBezxkV8PYN6KiE4nAEW/PQIULgJ3PcLw20I0aNdIwy8PwAOav
 8Wm3e+2iZeFSO08QT4op3ydE+bFH6Io282wnPPdSe3B7uc4cPtTUfe+XdYr1hBc4WTPytZQbc2/
 O4C16AEqRMcwk32L+hW6a80IekDVQuMFt68IPRHbofEuTxD+CdcTN1SivOjTmHstStCtcHBQ13B
 MnSA1oQVN1vQSzqD4EEKBiXQhZ4VgB+PyQ3+iL+/8J35ua8KwM2YgsXA1//M/DESdtG8AhtXy4f
 +aQHh1Nzb53Ho0ObkoERSJBsV+bXzzSEaLqWymf+N0gWGBmLC6Ua4vQqDfT5wuwmxsY2evTGICj
 8f+e5PNr34TtLvYEEe2hVcHElsLpO4G4/AGeeNgyWeDsH7Xe2Iiw8syV007jairTAP4u0X9fD2C
 A/7NEZKqN4/oj73mFOg==
X-Proofpoint-ORIG-GUID: YlR1hfjDwibt0wgf7ubJd_5dK8bj7CwN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX/wLnyhmXxoXc
 e9YE0N1lA3tPrwQKuU0K4aWQAEX+J+fcfAPV6c2fBIiSg7pH2Jx605tov6MRhGrOGWX6bcumLWc
 PKf1xcgkQcloY/jn9LC39OJvEhcpEuM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250049

Hi,

On Fri, Sep 18, 2026 at 12:12=E2=80=AFPM Shao-Fu Chen <shf.chen@mediatek.co=
m> wrote:
>
> optee_probe() called tee_device_register() on both the client and the
> supplicant device before the rest of struct optee had been initialized.
>
> tee_device_register() calls cdev_device_add(), which does two things at
> once: it creates /dev/tee0 and /dev/teepriv0, and it links the device
> into the tee class so that class_find_device() can find it. From that
> moment on the device is reachable both from user space via tee_open()
> and from kernel space via tee_client_open_context(). The only gate in
> teedev_open() is tee_device_get(), which merely checks that
> teedev->desc is non-NULL, which was already set by tee_device_alloc().
> Therefore, there is effectively no gate at all.
>
> A context opened in that window can run against a struct optee where
>
>   - optee->call_queue.mutex is not initialized by optee_cq_init()
>   - optee->supp mutex and completions is not initialized by
>     optee_supp_init()
>   - optee->rpmb_dev_mutex is not initialized yet,
>   - the message argument cache is not initialized by
>     optee_shm_arg_cache_init()
>   - optee->ctx is still NULL
>
> Any open session or invoke during this window takes uninitialized
> mutexes and dereferences a NULL pointer.
>
> Fix it by moving both tee_device_register() calls down to the point
> where all of struct optee is set up.
>
> Signed-off-by: Shao-Fu Chen <shf.chen@mediatek.com>
> ---
>  drivers/tee/optee/ffa_abi.c | 16 ++++++++--------
>  drivers/tee/optee/smc_abi.c | 17 ++++++++---------
>  2 files changed, 16 insertions(+), 17 deletions(-)

Looks good, I'm picking this up.

Cheers,
Jens
