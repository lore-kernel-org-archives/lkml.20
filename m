Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794123133;
	b=pVfQQFn9LjiijjCmej/l9XHgC7BuwSN1AjOk6wWYv9dfk1uAMKnCkv9ggU7Z67hM06pQ
	 zeFW5TQMcCQMh8PNkY229llUSp7d1amTpddmLzyQsVfJdRBc/oIuYhQoBqaMv+zjHWe9D
	 2oD+zN39i/sgueCxDVQY382WqRAuuS/7joCVKc5/620wLFTxUIMW89FJyAo+mCB9LTG21
	 +4AeRevUmuit2vSMdTRndP7fu5ONi80N6PwJOC1SJ6/HrnGWJWVrXs0jusKbvHGx471CX
	 QCGs2puLyFpk0llQlG8FMTKHkrydKNKdwRQkUJUG79rsQZocWr8FjfnM3XcbENQrEFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794123133;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:Thread-Index:
	 Content-Language:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gxiJBm5NHRze1wOQWiUuvxPhaR3l7aCkihnUvorIFDY=;
	b=Z/JwJ8a15/c6sjc7gwrf+HCYs5qEtDhv5ml1/rqET5qpgidXEGIbbNT6O0lxlduD55IQ
	 dgBS7evTbbh993fv3AAORmV8ohzYdTRjPxCTaad57uLLXSD9IJ4bAN/8cUXg2xZ5OrpMz
	 vTqwvvhckiz6QYp9mmh08M1VEJ914rouNXJ7kq2OyHrXii9BchTlkc3fP+V6cNr/bvAW6
	 TOHHPpjGWwET+qc0B2SOw7WM+hM/xxYicKwNLt1c7+5n0znaUgCr8BbhF9A1icz0OvVhq
	 xwC9w1cnAlBYNK0J20EQnztItAkgWNAf4pQp43N5BWSqaspKkXFMyWy5r5TG2UOt3Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ifk4dFYD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSRqLQly;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CAA606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 07:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0CAA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ifk4dFYD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CSRqLQly
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84KJDY4143054
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 07:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gxiJBm5NHRze1wOQWiUuvxPhaR3l7aCkihnUvorIFDY=; b=ifk4dFYDnT58wjpf
	MjXdboe71nqyIWFSqu9O76oUSUvdkmhwLM7mBv6O0dk4XSZcQukL20T4CwKNOAks
	CbYdZAarm+vggNFd6vzmSUkus+1IuWgH9O+U/pEXED/cDZuNEsKZ0UD53oIcqubR
	qsIvBSvwycrVXoCyOyqnG9miA+3f/F4+9OwH8pGlHyLbljMgKR85f+asA+QX4B72
	6Cy5dd2wWsLfQd6fsiQLuYAXsaUdjkg22aPf4/RhGaemKw5nWgIc5meSPnd7MHKl
	8EKN/Lyfd7aTz0TtpB9d/zNZTeJzLghc89xPTAaZHZDxcXKwZY80tAeBPqMgPkUZ
	XZshyA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsvretd61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 07:32:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36f26e6abe9so526706eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 23:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794123131; x=1794727931; darn=vger.kernel.org;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxiJBm5NHRze1wOQWiUuvxPhaR3l7aCkihnUvorIFDY=;
        b=CSRqLQlyNrDLgFtO8o+8nqfxlpIdVEPDf5vpOdkUR2t+f/9YTEATyckCIyjmyQ1NQe
         JdL4QQCvkXefGZ7rRXXfgosJvnJ94LPO9DwR2+qfy9s39I0Z1yS6Sybgpj6k1+SD2hi9
         M8isAxXxM4Rjay9wOJjmwOj2/4ggxsOOi/hWpJqB0dT5PAdThR1/OIkAm//ZTpPWNrzS
         AZZNgSY13f8KX+peSS63g78pNKqMvFPnvmzK9t1CsqfsUNn6iezoxsulN6yvnqU+y3/Q
         1/T6MenuKcan8hmjTf3qgQNuHH/k/M8eIbwIFAAMopgAvPboUY5vbrxmpl1CIocSgzla
         Fmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794123131; x=1794727931;
        h=content-language:thread-index:content-transfer-encoding
         :content-type:mime-version:message-id:date:subject:in-reply-to
         :references:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gxiJBm5NHRze1wOQWiUuvxPhaR3l7aCkihnUvorIFDY=;
        b=bUgtt00M2o4S0reBXvZKJDrXMl+NemzC7hpQjNgJTwaQT4ZKcCmQ3CwISgqXkLiVkv
         uzHjGxKjGRVDmxjVItNA2NH/2v3TxxEsTRklTofAv0O1ZBp7E+PZz7+lHzap3YQuhfU9
         USuHGGc/IpmwfPHbFHPxexZ0yGPB4B9q8v1+88OUKdhrTpEan/XKGKULwDd+3cjbMQe4
         m0UQ2S8T98jPqWD9fbwoIFYmYlahckH7LDw3lMk4WUH43RpPcts8iqPeRZdZWgso56NK
         M+1LJJljI432wEcWC50hcFbXgrUJGTUDXlGiwEeHH9nGkzW2PmMK8d1QWtBGASHrwiOa
         9wHQ==
X-Forwarded-Encrypted: i=1; AL+hErFiytlFUKbF4m8dQVG1FzlF7PkCHbbm5J2xkswjyxMQ26T6Cs4AHrGvnCn7kcgpaNk0wbFMRUw9BKlRmSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PRuzreD+3HvTOOV3SXwmJCgkKt6Le4Q4xRRhz9lI/VVqUhVjD
	m93K9zv5C+NASWDKu1h4Nb+4I40KZDokCaMfUrM/om50Ccfrrf+GqiUltPGhyTfAjYMUPdIIRFz
	kj47hJEOs2GNcmqKgxAh67IpPlUYZCjCgud1MhCX+Jk7WEHFKdtccE9V/YZyPFUi+cwc=
X-Gm-Gg: AYBFou30U9E5VIUvHfUSd5u4Xl0tMIsSdKNMzoTvq4/OKtABb9i6j+UlSvVXUstzqkt
	8dekCiCMVZOJxQf3mR4y0UlchRiwT0rd7U1BkDvSxe+bJSuvkM5puhVqFkHHmC+dS3uJ+4BLnVJ
	v8Z8h5iETrLw0c1aD8MzwFq5CDJqhE8RhGjmTFSAfMi/Oen/KIYVAH/YlLOXgMPZozo0IVlqlgb
	UI0Vi4kZazsPwUtZfJiFa8AdwdGReNGXaVIiLFoxpx2fjgacMwGm9XKximPu7lQ/iEMWOQaY02o
	1zQe1cVLgVizO8OLDXejwmuoA0OsiRmSxocNKIc7xVgmVdCNt5rAozaHdwAmDza7vB8RwZ+9aLs
	Nx7SbkKxW6nSmoKKuR06UPDBwqBS26XwgfqPbwYMAzeFJpZP5MVSa1IToxViY1QlqOgC35S1J6s
	WVNQH/HNESmP+17i7lU5qShKfL7XEtbmPrYE+4MuebuhuehaEmZjInDqPp
X-Received: by 2002:a05:693c:26c6:b0:36a:12c4:8bd6 with SMTP id 5a478bee46e88-3725807c441mr2104201eec.22.1794123131055;
        Sat, 07 Nov 2026 23:32:11 -0800 (PST)
X-Received: by 2002:a05:693c:26c6:b0:36a:12c4:8bd6 with SMTP id 5a478bee46e88-3725807c441mr2104172eec.22.1794123130329;
        Sat, 07 Nov 2026 23:32:10 -0800 (PST)
Received: from QCOMk1gASIiYhG (66-33-8-210.colorado.intrepidfiber.us. [66.33.8.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d6088sm3933263eec.25.2026.11.07.23.32.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 07 Nov 2026 23:32:09 -0800 (PST)
From: <subash.a.kasiviswanathan@oss.qualcomm.com>
To: =?utf-8?Q?'J=C3=A9r=C3=A9my_Jean'?= <Jeremy.Jean@oss.cyber.gouv.fr>,
        "'Sean Tranchetti'" <sean.tranchetti@oss.qualcomm.com>
Cc: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>
References: <20261101233427.2050688-2-Jeremy.Jean@oss.cyber.gouv.fr>
In-Reply-To: <20261101233427.2050688-2-Jeremy.Jean@oss.cyber.gouv.fr>
Subject: RE: [PATCH net] net: qualcomm: rmnet: fix TX aggregation teardown race
Date: Sun, 8 Nov 2026 00:32:09 -0700
Message-ID: <000101dd6f53$43952740$cabf75c0$@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGbpdxbh/nRSzqnN/vaM8uyj5zlKLenWosw
Content-Language: en-us
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAyOSBTYWx0ZWRfXwGKoGlFfWOdg
 /3/i2f+xhkMQgCCzNtwwAb06CNXd16SkY06GA/ebGtefNzux7nCoXLYXVM5lIN/cF/41d2D0CxY
 +DT6hbj4Yd7l26ibvTekULsQgtPyafU=
X-Proofpoint-GUID: lyDneIBDBADlxjNs52-d-XLcQJW2zcd7
X-Authority-Analysis: v=2.4 cv=FrKQbGrq c=1 sm=1 tr=0 ts=6af0257b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=OltkOWFNRHEXGe+8VJKHzA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=gUkXs5wQAgBOA1n-_pMA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: lyDneIBDBADlxjNs52-d-XLcQJW2zcd7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAyOSBTYWx0ZWRfX/cZCTR3UVFFu
 aV4J6XHvDhYDDIUu5D4ebePGuklWHyoOio9sJUpFsilDkeso3/Dmt2yoa3WgIyBKDkakbZgefBG
 7hpe8dUSD8IzfprHNfP8q1jDE5BsvoiWD+x2rcN7Sau8srdrejBnUsBGifpNAaJD2IIVUDsUWdL
 /E89anXBlyiXmpkIqSk1fB4HfMDj/g21h9p4TwTXL6Kzq3eFYOA4hgGlq02ZwMwfCz0Etv/vwyo
 XgVJf70zh7c6ThAHWqfhhiuU1vde26CQVYrR6sizFEJXQSKa3f4w/od2y/DRCMaehsNRv5aqB0X
 Wbr8gmmQ6NyVkpSdNRB3YdCG+sU3HRw484RC9dr8E9aBjGqzZhlpIdACi36XH5UxFW15gU1tOaF
 OKwM7S35sy9jjvIx8f4wESP0sUyg0iGM2Y0gjzOYlKYRMhHcS80pEiWAMG1128OYxR0S7vn7IZU
 mQulHiiQkvBhI8aDsbg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080029

> -----Original Message-----
> From: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> Sent: Sunday, November 1, 2026 4:34 PM
> To: Subash Abhinov Kasiviswanathan
> <subash.a.kasiviswanathan@oss.qualcomm.com>; Sean Tranchetti
> <sean.tranchetti@oss.qualcomm.com>
> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; =
J=C3=A9r=C3=A9my Jean
> <Jeremy.Jean@oss.cyber.gouv.fr>; stable@vger.kernel.org
> Subject: [PATCH net] net: qualcomm: rmnet: fix TX aggregation teardown =
race
>=20
> There is a race in rmnet_unregister_real_device() because it cancels =
TX
> aggregation before unregistering the rx handler. A transmit that =
already
> obtained the port through rmnet_get_port_rcu() can wait on =
port->agg_lock,
> then create a new aggregate and rearm the timer after
> rmnet_map_tx_aggregate_exit() has drained it. The timer can later =
queue work
> on the freed port.
>=20
> Unregister the rx handler first so that no reader can rearm =
aggregation after
> rmnet_map_tx_aggregate_exit() drains it.
>=20
> Fixes: 64b5d1f8f2d1 ("net: qualcomm: rmnet: add tx packets =
aggregation")
> Cc: stable@vger.kernel.org
> Signed-off-by: J=C3=A9r=C3=A9my Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>  drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> index 61b04c6c0390..2ff4b9519139 100644
> --- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> +++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c
> @@ -40,10 +40,10 @@ static int rmnet_unregister_real_device(struct
> net_device *real_dev)
>  	if (port->nr_rmnet_devs)
>  		return -EINVAL;
>=20
> -	rmnet_map_tx_aggregate_exit(port);
> -
>  	netdev_rx_handler_unregister(real_dev);
>=20
> +	rmnet_map_tx_aggregate_exit(port);
> +
>  	kfree(port);
>=20
>  	netdev_dbg(real_dev, "Removed from rmnet\n");
> --
> 2.47.3

Reviewed-by: Subash Abhinov Kasiviswanathan =
<subash.a.kasiviswanathan@oss.qualcomm.com>

