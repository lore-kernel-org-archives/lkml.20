Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411615;
	b=E68EK+zbRmCHPVLWakcj+8UQuO2w1sE/kilt2eAsZLvhkJyjQqwm9C7WBRRa+9hZNCdz
	 YYo7TfAERFaWyzE1JS6GEYDCXNMuoKLvAXwKnYZjbbEj+QEJRLgxFqiFD6NymTEFyAU5y
	 RpyVCy+rZq+CuJ6JWuHSCM0R+JaUBbd2RiRLo08QWWo43NI9DAeCfadjvkwphk2LqwR/9
	 y1Cb+Op9Nb1PDPKJF3dJAj6P9r7PHBQshTSImFNSXxYj/YGreoeUaXpYlfs2WvIrrHiA3
	 oLbH37QO70IlsVNy2Z5awDDBuMKxn1xT9Y7aCS2gp44R0veo01Tv/P2lD0aWGMLGKLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411615;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yQk6KBaqCt7AnjmjWR01UrzGMS5fFH/wI09BIEpiKSY=;
	b=gRDQyxZpygU1M6bKAsVU82HFMgGZv8m4WFJIc3d/TB61BvDH7xg7A+R7ngDpUMuSBceg
	 NA1udflUmUqlJpxJfNBxtN8WJ3dt7EP92wiNOdOlRqbyJKHwrjPEKdLRfa41ptWTrj3Cp
	 0aKwgQgpeYHAir86sUfFjPD6Nb74J8fCoeAWuwbWGuKdENRla37eQQn7gYUKnuL7nyp4O
	 MVFiVjbptS6jr75+azvJ0l2JYCrK6ZTqMYAVy/mL21+eVwkEwIc1LheQ5QLR8Lvrzi9Dw
	 3M1oHnbHg2vCW8XeCl5OzoE+HnfEnMMbLXFEKWzlkg+Ez1GpjT4KJgjOR2geqnQroEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOVu76xY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BT8BM0Ek;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0550C606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0550C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOVu76xY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BT8BM0Ek
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABFOxn3013057
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yQk6KBaqCt7AnjmjWR01UrzG
	MS5fFH/wI09BIEpiKSY=; b=gOVu76xYx+vlF89Wx0tHLkn5HMSA0bxHxNqbsuoM
	sdeK11yjOFoTT6U4HpuTQIGsssZnLbmvN2qjkCxOWytdGOPqdIOwkwLBu7RpZcqy
	fsQRtER+H96Ffj6CNPw84qrmdSDlixRDp9cGFc4rjeyxgP+mtCU64vNpXpg6S07X
	WUiUEggNPylFKO4WU14JL6S/msimrcgDDwouA9ZkQQxbYgYVMm1IeOj2fiITsZcM
	0tVDpz3k5lg5gaugO3/4lhHb6l1/ezYOLE/YLpzf0stOdDPQ+Ls7+4p+Jec8SB0T
	o9oH6RYU1oisEbERgttHNzyStlx1G0Ylr3BKWT66CQEAhA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymr31u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so603355485a.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411613; x=1795016413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yQk6KBaqCt7AnjmjWR01UrzGMS5fFH/wI09BIEpiKSY=;
        b=BT8BM0EkvDBvMPi17rKJwrGU9o46nvC3XXQNqhKTWR5I8X7RDaz93B1Jzrme/C4zWb
         QUDGlwCQdnzTj1dIQsR+idtAaSTJ/OqYPveb9I7FQTR84oFHXDJCns+SstzcKre3Ai30
         8Afd7ajO5Ntt6hcejIToZoCTHjfHRjdlo/KDADlghDnO+f6yxEg3kq9+Ef++26mKlKZ1
         dMhZLbXsjj2AZgQfjxE9gMY22OpFBFCrmh7JIRgZUigQBk2zrcvxfM304zrzNJsdcGdh
         M+wlR0+9KA7c83PPK0/18Z0XVnde+WEznu6pG6vUpLyOHPIVX7cj8rCzvOv9st53Rr86
         k7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411613; x=1795016413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQk6KBaqCt7AnjmjWR01UrzGMS5fFH/wI09BIEpiKSY=;
        b=q7Fpi6Nz86uXfjt/niowBwRwHokf1q9PsrO9MrCaUNxkiaBiRShZjk5kPBpdQN0r8b
         sWRi4jA2RqxS1apaiohkyqXgop3eNUzveetrchAs6nTP73Vigc0JwrjEc1GtUJ7IuJv0
         UnF0lW7Fig23cpV8Zs4tB/3p+moLRwaTHxfhqarshVuzxJXDzyuVuOIrPVYQvxk+yvQs
         DDomtLCs4upfWs4E6zjwePtHxiTFVi9WPsMyYo+XQNmKwpjC6Xbu/yKAO4vLZxknjsxT
         xOgN3JSnLgFmgmr7dG5OG3w36D/bh57J5DSnZUYdbgWiWXiaUCfYv/LEXPfKvsvsvJgQ
         aWfg==
X-Forwarded-Encrypted: i=1; AL+hErHyQwEwQiL9SLhMSeC+fgUwwn9e613QyGorZgD7A6HemuNnhbAJn0t0GMn3JExoBWMu8Uobvl6mzpqxZoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DuDi+TpKocYTTLoyFEA1Y0k9pip8PJ3Z0Nztib7sG/HoHlqvt
	G5yXDKqWS/Pdoj6jf7o6RpJUAkBI581jPt04wyQRkjaqjTDiG6++KURkm03m8WcqZp/KWkydCEd
	JzG0zhF+QIEPpCq9RpCt5OGtNTp8m+9/JrvoBficVrvG0CVhpeJ8Nl0CO/UEG+sU6Oe0=
X-Gm-Gg: AYBFou2mpcpbdi1pnlmCXGcVpOazmKQp4ay0PAjfUMYgwAEVr6QZGOif6zEsvoLsKLh
	o06FUcFmN8hu5D2u2WE+B29rMXHs4toRky/bALMcKTriwWua21SRh0Ug5fUIMOZTcSze5f//lzE
	dmWhBoaoHCta6+UGjKX+VuapjfF4nenU3p7OA7bz7UFUZtYkwoBpYmo0lKtDCKu7za4idF6SHgO
	UVhGYOzj6axkS3Cj/69ULpdvQ8KAtHE6wvVWpM6sYAcCdLOz6/exf43HlXlYgu+uOkvpl0LF2vl
	dJeLKMdvCHPGt1DLo5rpQp3OKY1unnSZ36jWXMClJkJsthHW6BNxVmAGDOuMmua9HyqTx2J8Epy
	J0XFAob6tBYe2lDZP7ftuKQ4ZU9ID0bENagb3ZYuPDOsDcxLeXRnsip/aZvOwuSE8nVbzl5nfvN
	S2gF/b4YxMNO3NLFJbFAX6/JBixHybcLU+e9F9WwGNoKK+PKly/cR+PeowLoJYoA==
X-Received: by 2002:a05:620a:8016:b0:93f:1789:8359 with SMTP id af79cd13be357-947ae88a471mr518126285a.31.1794411612914;
        Wed, 11 Nov 2026 07:40:12 -0800 (PST)
X-Received: by 2002:a05:620a:8016:b0:93f:1789:8359 with SMTP id af79cd13be357-947ae88a471mr518121185a.31.1794411612413;
        Wed, 11 Nov 2026 07:40:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092293b0sm11877221fa.17.2026.11.11.07.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:11 -0800 (PST)
Date: Wed, 11 Nov 2026 17:40:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael McAllister <me@michaelmcallister.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: avoid pinning the command buffer on every
 transfer
Message-ID: <6m4cssgagnpvm2wawyj62veoqbglxv62rcqgxzaxvjynhn3dts@tlkaxvd6ph3n>
References: <179422752570.88190.13452031230666113805.msm-dsi-pin-leak@michaelmcallister.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179422752570.88190.13452031230666113805.msm-dsi-pin-leak@michaelmcallister.org>
X-Proofpoint-GUID: MBkf9yZdabSyqNxFlshqszYqfijPLcTA
X-Proofpoint-ORIG-GUID: MBkf9yZdabSyqNxFlshqszYqfijPLcTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXy0F/T/DiQDIV
 bfRfdf2ZOa1ooWyJ6xHoJbOOJumjfB7PyqveZHdjFgOvCEr+7UggF0gb8QmaUKq4JwUt61GHZRX
 cbTgL69Q2kJvhrEal5IP6Txzjmq/KTByF/kVk4pt/8xPq19Aie0MDL65sZQl+bkmbjNIV4y6elC
 uGiuoLoI1WjyvdN2hxxMRAQ+rzkcSqEO8PCuoYyvjMo8NWekTeq1g1hwJN5D4xm9dsshARRjoWV
 jAvmB0RNoKJ9js/A8MUdUD17DgmuTfJxXObb4bRGqMOQS28cjvEFgJFex/l0tMYxg9I1XlhcUsK
 flSXeNyWwKCH5W9ANBOwIKJW/Hht4vIST/Y5+nGGAlopSkA6atpOo0CmpKsH8yaC/LugRVA2/Fw
 yumswQMrnkOlJ1BF9dGU5iOcb1WE0tXmdLyyQ5dJ+dn3B02KNZQU+iPfJn+QMLFl0qy1DxH5h/j
 U49F4/SwfC5KDNm9RfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX2xlQKLu29c7n
 grNpSYDLqsbVysRVPLJoy69it4tdehRZfjniGSs/7KiL5DhAbC0nBC4ZSVaku7YW7o1v5taMXmA
 VGfuZeiRmzGdkUs4Dv6GaZxVyBh4ef8=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af48c5d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=JwJ85b4fAAAA:8
 a=pLk9kBtbcEIJPp8lWhkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Mon, Nov 09, 2026 at 12:32:05PM +0000, Michael McAllister wrote:
> The command buffer is already pinned by msm_gem_kernel_new() when it is
> allocated. Calling msm_gem_get_and_pin_iova() to fetch its DMA address
> adds another pin for each transfer, while teardown only drops the
> allocation's lifetime pin. This leaves outstanding pins on the buffer.
> 
> Use msm_gem_get_iova() to retrieve the address without taking another
> pin. The allocation's existing pin keeps the mapping valid until
> msm_gem_kernel_put() releases the buffer.
> 
> Fixes: 7ad0e8cf6317 ("drm/msm: Count how many times iova memory is pinned")
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---
> Hi,
> 
> I ran into this while testing display teardown on the Moto G10. The DSI
> command buffer is already pinned for its lifetime, so this avoids taking
> another pin every time we fetch its DMA address.
> 
> I tested this as part of the G10 display fixes on 7.2.9, including display
> power cycling, suspend/resume and teardown with the compositor stopped.

Sashiko reports a double-free and I think I'd tend to believe it.

-- 
With best wishes
Dmitry
