Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793912014;
	b=aeuJ/JaNWXZzCXBTBSCRU8wbGJizoJn0KF4hOnFqdZyP+UcZ6Ko6OmYH52xPQgkSGfuk
	 Pduvjmcp74fMLLEABmpGElQtqyze/ian3wrPCKRGnyj1HhqMioYgHIX49kNWmybBkERwN
	 0gzCchA2lKawuYKN2jzGb5pQcQZPgSolaoYcHxdcqEl5XP0OX3abbuWPeOgP2VWm3kOsJ
	 Nx8w3WdpZ9ZezdjkV+iPszH+CFcx6s4ybsLrlIqcbAQiSnvMDgEjL66HS4PV5kjPaMruE
	 KdlsSz6CLXUIvSbACxjYq76hIUopeyiEKCx2p6TK7p6LDe1Ybm1aF6IRoDXtiOc72pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793912014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=;
	b=Na6FhD4w1hfdk6ECyRdRhe+I1EuK+Z74aUbCuuYT0K5oc1Y0sHLKnCGZpG/Cu1QHPHfh
	 +dUV7Z4P0308q2NOZZxxrXMuGSz4Nic4S2UT8pLtDyDz51k7jbsHCej2UPO5NvmV5zPlM
	 72MYpEo5kRE0IdwyJ07cF2g82hbVkas20qopvwA3c2IfmUz0YloHhl6tMhxWuauG7Ybu4
	 v3YrSWveabnDIgQeF/vAsR+/zPoqxD9wo6rWWusZLK461ZqCCHHpKsM+L0IA1MEs7HHdj
	 8XAXv9MsMV2fWXSDkfrOvro/a4DIAw/OFpvVjTngvaZ+hgDgs1BuLQzAR+bi97wmDMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3rtgOhS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Ccwam5W/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5571606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5571606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3rtgOhS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ccwam5W/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JLEuX751780
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 20:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=; b=M3rtgOhSCcj95UjP
	3/j4z5tdBB2n0bGDiKdqXcsrLqnbIpEvXe7ytaOgEsqBtRaCIB5Q+9qoFlKPhxaY
	TigGajnv7BOLByYV+yFakkTo8hzBZGH3ptefucT9IVDby60awSQE2RMFPU9ti+Nc
	+CNEsOWYOQqmSfBgKDhCSRP45oet2N4myk31oBxRca8evzE0D5J6mIURKqNHNe/1
	6wY3k0rUy3jammAdM3kDUwflelcxKxdOuKcW49xP54FGl5hvA6j5SajDDaUUYUvn
	3goc1QpDL+qWi47208V1SV+N3YIUp7XcBIGgXOZZoN1ac0CbIq0OFgKHYS+uRjoG
	A59I4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvp8c9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:53:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so450192085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:53:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793912012; cv=none;
        d=google.com; s=arc-20260327;
        b=QXWycvm5cRRsFcz8/VAp5iDN7R6g0AmELsRFnj9w9uUUlTSCEnFoSt9ukT2Hkc+AZv
         tutD6Gk7TB6/Y7JBihU8oNT2R17YSbOT8UMDAn8chFhL6M1K1/8S3UBP6M3RK9DBYo9r
         Uk0DiSqFGci0AByTkhBeuAkGdTXlaKOWKe/xJ14gKQ0OQzPJo9SfDD9z5/dfWuUDansj
         VURE6XZqehGPzwXC+Xs7zpuplV+hIu+jokXf/BjnJjRkmAmO89L8fTLeoW3nw989MCHv
         vabgPFmfREn/a3J6t81xhg4FzjLmH8FBVRUGg3DAQtKefRnu4GG99BsTqw2gLegkET72
         sbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=;
        fh=/dYQ3TEw3bPBgm7Tn3WTB8IjrILOM0MT6j4cIwk2hX4=;
        b=SFkoKdYHQgeb2si9KcZGsajbS/atwiBtUXfuw6+qm6JLRILSoMpSlwGGrGP0EuK1Op
         Yw/Tz3m1z2l4g6/6HUnXtXYX1l21OKkY5i8Y9xT5BbP9ZLZMdnAHDxGTIIWFFICHX3Dn
         iWw81eGmc78491lrdQvpiypV1hrQIashY2Tu4qTb4CG4uihGyHzR/9Wzm5dETs4rQoNS
         Zd9+pxb3HRcRTewUqQb2g0qNUXZGMGkGeMOe+NU1omjyK1gI7ZnTVaIUyx7OkJvwFr8A
         LAFzMyH+z4cCAcxQnbhE8dArFS2bLfJpRCjbl/QUmzMNnOTaay8fslGQqxYnJkHMKZL8
         C8jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793912012; x=1794516812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=;
        b=Ccwam5W/WvzY/IBMlx+xByb6wMF14LjejTxN5kK9JNwnRITHvxTw6KSqmVHLrah4Vz
         Nt9kCNXV9z6nthF+5M82e4JBqnHZWmuPdImRg4IBte7FfHp8XJMmwn3pypN1JVSkiar2
         sLYNnG2FSSDp1MU8IID/WBgKR9Lxjr16nv3+Yak3jmOelY5oCi2O7YzsiLmdnKrs8WFH
         nXXKoqumLU4I3gc0ziDWbK0NQL9OG6hUUoeVLEBkP6edzlW7xks5Tm9U2MnUne9eA9Rm
         /M7YXf278idBrE+qo11MZgruAyTfWhuq3iorvJb8JCHftFKJTJUo2v68xbEpv7djRb/f
         bN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793912012; x=1794516812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VdfCr3YAfSkExQWrhbCZiTK2F7YdxiQNVYIqmgs7E9o=;
        b=nqVBaOP/s4l3bMOAuFfELLi6V1SDTh/SXYEiwfXT4FuYr7L/U8ssRhvKcpd/AO3iH/
         akQ+NXg3AxbIsD6oqz5V8g5upL5mj4qOHLknw4IB5crP350yMyvzw5UamvCYxviXE4j/
         1b27zlKFBBeLA9gcc83GMueu8fgk0/X4EL8wGo8zCZw4vnD1qPD7SeOBOcT9uBicjMt2
         iOhTANBRCsk7JCiiP9mtLUbATVssNe/lxihhoY/QBfhGEmLWoG1aCHQnjMCMQLc/DdBc
         CQuoY8QPw5Em2WVRqRNcQ1OZTUQ+GI4FwCYuDPocLEyRDvsxZPOhQZ4YI3tZhwCp5wdr
         E+/A==
X-Forwarded-Encrypted: i=1; AKwUvBzZ+Jhp5O3Zd2ueIO0Fzn9SZ+mEsXZI2ilVmYlFYO3GtpzrCfL5RVBSO44psYCdBsIIjWPCA8706NLm4w8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/11E/G/pgTLp3f+tSuCMQE9QSrP20QWB7iOXGPVKEUQhQgAzl
	EdlBZ081Jd+I4IzU2tAaukGZ0XN2bCwtMuhRhB6djW6HBS6wrhNACMN01PpL9i3Hfk36f60N4ou
	bM8QihswBRi2/v6PtJiNIe3OMHsg1fFRnk/E22/LfXY7z0kcuOzBTJPKdCN5WppbdXSOhQOKwJb
	wh1S9WQqh+DxmjYIKjv/LkUC5tjzjb/4hKdwzbyzPOPg==
X-Gm-Gg: AYBFou2zp6y/z/QSTNz3bQQISfYbLL3nVf2zH+6oEJYcBnP3kdRRzIX33H3KlAgcj1d
	9+rBCbZeOJ9CPLStT8BTqQgDk/sJKIFW6tyowBKQ6JC14srhBpHlpF9B9FcJ0DX9LjWEN1eBFSJ
	cuFQ6+pyx6eDRUxJrItsqNLxeYH6n8A5UCgdTEDCgb/d/zHfdr3n+z1CuzYXPcNZSZ+DOqD+0F+
	a1h7VJoT4CIhDqB7kTCoffZ5tEUfDN7PP786d/nb+2jWRdPSj0JmZLgwwN+6fifFWlrafsxtIA=
X-Received: by 2002:a05:620a:2842:b0:93f:1936:b206 with SMTP id af79cd13be357-945f360a793mr39835485a.83.1793912012157;
        Thu, 05 Nov 2026 12:53:32 -0800 (PST)
X-Received: by 2002:a05:620a:2842:b0:93f:1936:b206 with SMTP id
 af79cd13be357-945f360a793mr39833985a.83.1793912011754; Thu, 05 Nov 2026
 12:53:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-ath-recovery-scan-timeout-v1-0-99a70d89e114@gmail.com> <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
In-Reply-To: <20261105-ath-recovery-scan-timeout-v1-3-99a70d89e114@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 21:53:20 +0100
X-Gm-Features: AclHuK8M2UGEAgtgAaYS4CJiDcLNJz8p_a_dG3tur9BUocLC8UmA9Ko567IQDlQ
Message-ID: <CAFEp6-0O=cPYKndr9hen1jvX==ot2WP4JpGfNFLokVvxUEbxiw@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: ath10k: don't arm the scan timeout for a scan
 that did not start
To: christophergriffin05@gmail.com
Cc: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Hari Chandrakanthan <quic_haric@quicinc.com>,
        Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
        John Crispin <john@phrozen.org>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        ath10k@lists.infradead.org, Wen Gong <quic_wgong@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Ib4Symqa c=1 sm=1 tr=0 ts=6aececcd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=CkqNy8FowFOMXlqwbJ0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 24yogB5i0GNSH8nv3yEwLmfpSRA116pP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfXwAr0fDRpActP
 x6xDLbpz+VOlEZ9EOB4QGPq40q+Vc4PSMWDMoKdDQAaDvAy1buLDpUX91o5aor8lU4hgrwFrcrB
 hEDxbP7Ak4WAPPWc2tD5k7O/FRWhuAbZBmTc/6L68/1UlKzYEjP7Hp1wuaIHt6C1yGu7bHV8PyH
 LalNb0kEYcW/ce8L8wgWoi1euyvxmgEWWUOr83c62XZ3gJ67he4As3vc+RugcbS2qDuKeIQ80jN
 M+/H+OI9HKJBa97ZhLdTG22cUvX+yD76a51iW9aUBdlZ11etP6nei9FdT28hyhN/MkKrXReeN78
 WFDMxgdlt7z8iK7zB8RM6TkIEbR6X4qT+JuaNLo61ShrFjk1xeiFWzKH8mvaHHjZxJVzu0fSi+8
 c5MehC5dOIGjjiOWx0GQ5sg0yR7ucpGCFHBe2u93Jf/zas8LrjfWGUhqDE2ezUwZzwYrwzBLnh5
 yMPKLLT/6xhbS/NT6zA==
X-Proofpoint-ORIG-GUID: 24yogB5i0GNSH8nv3yEwLmfpSRA116pP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MyBTYWx0ZWRfX8oPSta0vc8jO
 OH4J1UoxKFgq1xSj+JSkwGJ3Z+8go356zdRI43bcY3swc8nx9CYV85GuOvtwSN5vHrtgkWo8kbc
 MX75aPqBWEKPlZOGvgXqS8Ucq4X19jQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050083

On Thu, Nov 5, 2026 at 7:11=E2=80=AFPM Christopher Griffin via B4 Relay
<devnull+christophergriffin05.gmail.com@kernel.org> wrote:
>
> From: Christopher Griffin <christophergriffin05@gmail.com>
>
> When ath10k_start_scan() fails, ath10k_hw_scan() sets the scan state
> back to idle and returns the error to mac80211, but first still queues
> ar->scan.timeout. The timeout then stays pending for the full scan time
> (20 s by default) although no scan is running. A scan started within
> that time gets no timeout of its own, as the work is already pending,
> and the stale one aborts it early.
>
> Don't queue the timeout when the scan did not start, as
> ath10k_remain_on_channel() already does. Until commit 634349bae0b2
> ("ath10k: move hw_scan worker queuing") ath10k_start_scan() queued it,
> on success only.
>
> ath11k has the same code; there, a QCN9074 firmware crash during a scan
> left such a timeout pending.
>
> Fixes: 634349bae0b2 ("ath10k: move hw_scan worker queuing")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Christopher Griffin <christophergriffin05@gmail.com>

It looks more like a theoretical issue than something that is likely
to occur in practice, but the fix looks good to me.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless=
/ath/ath10k/mac.c
> index 8e604697d6c20..2fded15b61721 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -6491,6 +6491,7 @@ static int ath10k_hw_scan(struct ieee80211_hw *hw,
>                 spin_lock_bh(&ar->data_lock);
>                 ar->scan.state =3D ATH10K_SCAN_IDLE;
>                 spin_unlock_bh(&ar->data_lock);
> +               goto exit;
>         }
>
>         ieee80211_queue_delayed_work(ar->hw, &ar->scan.timeout,
>
> --
> 2.43.0
>
>
