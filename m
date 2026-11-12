Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487080;
	b=LYMvu3if+6Didww77/g+L7IYWc6fTu8fBbMjou7qbUR1KR5KroVBWrBUQT63P7N9WKlr
	 O4Nx6+8hdNRmJDNKhBh49xr+MjRZb7Uk56SIQzFlGOqZm4W2rKb9pt4CI6yj2f4av9Jge
	 2PtU1ycu6gqxP7SMYZCh1MkQwgBbP2zaRVWEec4muYpI2r6cTyArI2PqRCJCdlNRLFarl
	 0L/bD5/PboOemuf9z8JDKDl6jOFYKeM5sR9JPmD9iBjP3TkgamXImXI4Upaq8brfggUyL
	 zAK6EA3WLo58AK/UF0toJ1zBMsG7qx8ul8Q4lCf9ZjfdNmUVu4OhsV7wijNcDQ9SAhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
	b=1FJfoJrJmz/I+QmBLrdSWRFfLSgTmMEwmHbOJALSrSy+pIcZ4FWvNcCjoMsoX9Kw932N
	 BHDL2jruNl9HoH/XEE5iT5eikhuiEJ3VPG/DsRjvNo8LbPyADx2c5gqK4ZzlDMZ5Yim43
	 oCGSkSIXG4KpP3iqklCuL2xF08etgswHaWLSWekX5avX4EQm6nK9Pl4y7Y2mvun3kPlEH
	 CTX7hPYtcUD6ewqD1ayYeFmhkqwI61RXHcaguVeD28a2XnyjCXAkIiQ2uGjWKIIIurnAR
	 6AAFI1/iE5URlMjVTMMS9xS+N2NhzfSRhurnImK7eRoGPZG1dJIXJ5bB7VGB/FK2QPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ckOi/o0Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5KkL7nR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD78606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD78606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ckOi/o0Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V5KkL7nR
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7iqLa125791
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2LGSwVG6leA
	os56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=; b=ckOi/o0QcnZRHH99pJLvX1OL8aK
	d98Z8iCmRnBJ19fb9L4yy/spJsZ8xgqitsFBbR+FSlaspGSGBUSvh3t5OiiyJMkB
	xTRU2ykWt9ofh/+ondi48YcxdrJnqayxsUU2S1EcvrGcaUEltMHRFi33lxs8vv4h
	8EmPh7S35wq1r05pAtlVhz3bb2ag98ACHvtiM5vzH6X6r1DkbyNOjKEzxXXWR/tx
	wSvpskvCew/FLxpYeAzuynJaQDRinXJD8HUXsdU/KFyek1BYq+4PhNSeujOUwfhl
	aVOCiCk7CnftIg0ZhKivEctkKVGcBkuLhPawp0tCO2pWXLvdx/tXQoEyxJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9a09165-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:37:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-945b0154705so651071485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487078; x=1795091878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
        b=V5KkL7nRrNrlfLwWnvuI6pwqih/x5qxtaxymubIDSG2C+tQFALtuU42h+oap2I8/JB
         slW3rgq6lLLoc/46leFTOlSt27RtXWOTPkaVQ7dpSLCgeS7BmBxZdHcId8+nV3J5hzCL
         fkbkg+1uDwZFDoDQ3Tuq7SUp79G6birJ9ACZ1ftDBHCfEt6Fl7ugVNiJDPjWI6VQpUwi
         7+SFSc+/Ijrq0VXEJWmWEui15ZTUyvhBDzSgeZuJRiazvXtlWmN/iC/3G1UFl8uzG8jA
         GEn/cAj6gH4WZXKv2DULZYXP1F05KG+Kx2P9ZG7XoHDuZhKNiEKH7njMx3ADWNCSYiXT
         IjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487078; x=1795091878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LGSwVG6leAos56EnJfcUfJ3UVLzAsF77/obd9U1Vhw=;
        b=ekf+EdR+EzDjtqonccnR+N/Fg+xu+DTRyjABdi45SDPqQxQQzZ+6BOsd/EdJbAjyzA
         Ve2x4LZfkNSPJXHZ5dFzt/+4BiPuqzb4x1NZXC0GDqJfm2VsU4AiKYfOxzEkecRW/KiK
         YOPHQ/o6OB0812tziVvI5XurdXN5nlKIJvfLK5nIThnMhCv0P3iw3Z1377BGaFdXp8uV
         BwDQzmb19ndv4xZd617T4bInnVVOlF8qTiitwSyHKlLucczdZUzaxSmIuKUbt0GIQP3r
         5lnJnwdgdpIN/s73GSn8g/ByQcV3VSdnu+W+MOlOnS1y7EgqtnthnTXtNsPyts5Q43ZF
         WP7A==
X-Forwarded-Encrypted: i=1; AL+hErE7vmlkpoaknZxXBi+8oB0fmFAUmGQKy4vKR3PF6vftfBjwewLSgnznUwxbYK7Ep9kZqmgNuQ4K7bB7gqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XTOwHWdq/bbT/HoS67Ck1e5rK+8S1pgGq3KU0F8gM9+GSibSN
	dKq+Ig+0qkVAWpZdOO3jHUpZWo1aG5u8Q3NDE4TiwUIHPxJnPU72h2QNAV7N5FNUabwh69RNAh/
	uyy/hWohvWhr9u0b/47lnY+vIm2py1OmPc+UGFlMWu5jijafThIe/sFA5QLYyIOUSVjg=
X-Gm-Gg: AYBFou02CTMzrlnj0fkQrLzrx3NIQoZbHtv3isi8+KJghtSKikRTy0CLH70uEfGyq9X
	KfayV6UObM8KYlkZ7bEe0o68aKUC6NuyFsxaVbCWCzye5xi/wadvp5jhHlDmU2bsx906PSLILGX
	HGPT1YtQNcTDvb3te18sk1AKdr79/GZ8nOCHOWOtoRrsTjwo6+KAYRbNA0gAEq45IDNfvywgAa3
	5P6ySfeZo0gP3GpScanFsEkmJRD7394iyyj95Kev+f/ipt8WJsPZYRkvqESiZXl/Lgm/B1EAEcr
	UBr+60Bs592HOaB5ep8JPz6vG/W3RDty6xSgHVbmqeBmuzWKRlrFR/EvGajWOcwHyFBEPCE9/FI
	3mId33PgmZX7UoYIVAnNBH/ESjtrwUoRAE3OfwXpYlu7ReYqN1Y97U2QyDH8W9aGd3tg/mTErRA
	==
X-Received: by 2002:a05:620a:470e:b0:93e:c12c:f128 with SMTP id af79cd13be357-947b00cd27bmr911341885a.67.1794487078525;
        Thu, 12 Nov 2026 04:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:470e:b0:93e:c12c:f128 with SMTP id af79cd13be357-947b00cd27bmr911339185a.67.1794487078095;
        Thu, 12 Nov 2026 04:37:58 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7b23bc254sm218990a12.30.2026.11.12.04.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:37:57 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 12 Nov 2026 14:37:55 +0200
Message-Id: <20261112123755.711756-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com> <CAFEp6-1dryYHtVme6M7opGHUen3vC+DyLJM8J1WKqVp6zwMWWQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KutbBvWK0WIby_J7ALndosu0QLYuOeLh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX9fJ4exFq23Gz
 F0PjHg4DFj36WEeDPv/yr6StpeTQ6k65Yvh8U86VuJ+aKdWOAZ5dBYpz0K351ekb26Fpa94/bTY
 KjbfUkLOYbqEV36WRU4NgsuN3Z8RdO+1zrtvBkQXLgFGUpyJ+VMPuEsyzTr5g/hl/DMar22n4a5
 BBmNwZBilDX+iCdVsp/ngxtcBkaggAxIHWOLWVr4RB6C3eDcQYSVRObPnKVNqrqV9N7IEIifwCQ
 bGeDl/xZl+VjFuJm2lhYraRXhbHUeXBCmXo2xcYcNoV60dEak3mPKTi4ruU1B/Zv1j4X1CfOLqX
 vLgGHqdhTyOj06olGTEbs4MtZL7pvCm/kCGfnrMVrkjwRIGXmyE4+CDhmgpYObIf+qaUUqkEG+y
 HCN+6ynnSHeQ+nlX9WXrGHAlyDb7XDCT/Y2ADJTzgEYISBPnTmJN8CgFZPaYq1OmG+YgERT0PoU
 LAdq2BjM0WcvcGq/OgQ==
X-Proofpoint-ORIG-GUID: KutbBvWK0WIby_J7ALndosu0QLYuOeLh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfX3MQLCZGLORNv
 DKzextGn54Rv8kimkCNsMd8/x5Fv0UbFFOu0IIul8+bTeMPIS7scCMbQxJfrfyVGGP0V1o50ZPw
 UIIZFQI5wWWYB6GzjsDC2VcSIK7BMbM=
X-Authority-Analysis: v=2.4 cv=COG/zhrD c=1 sm=1 tr=0 ts=6af5b327 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=FGaIqgoJOpKkMoVgYFUA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120050

On Thu, Nov 12, 2026 at 09:41:27AM +0100, Loic Poulain wrote:
> I find the clock names a bit inconsistent. For example, camnoc_axi
> explicitly refers to an AXI clock, whereas bus is much more generic
> and does not follow the same naming convention.
>
> I don't have a strong preference, but perhaps 'bus' could be renamed
> to 'data' or 'nrt_data' (SF path is associated with non-real-time
> resources).
>
> Similarly, for camnoc_axi, maybe something like 'camnoc' or 'camnoc_data'.

Ok. In the next version the names are core, data, config, cpas and
camnoc. This follows the core/config/data scheme from the v6
discussion.

--
Best regards,
Atanas
