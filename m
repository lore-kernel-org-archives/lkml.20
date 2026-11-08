Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794134772;
	b=s8WH6yIjIf6/m6IcrwYty9s8vebldjjQ2x06iSe+VRSX30X1gI832a+qlQnlYeO7dWBM
	 FpG4LnKw619D+sGqwbc+wkAH9wTG6oTLz/7JBjtQpocZnNcSYkz//qmb+6fbzhZQyJbdd
	 Nj4csKJRv/U6elfORrl0lhqMsqGGuN7uz4sGpzq1mVP3uDS877VQv/+43rFSRT8q/ILEl
	 NzTm8ytqeO4lVSMFxqmd2PYx18hJ7TYIfsQQrAap8/cqjjQmRsY06tv514tnrrQ2fN33I
	 LHrkGKYVs7eaZsONtmg6igN77YR21kH6J+XT5f8WOiypy+aXNvxoRa+t23l/X9T3QYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794134772;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:
	 Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2y1zP+2Iv01LMq7qQF4cYVebYl9REU89f4HGpMK7Ppg=;
	b=ryCBcFR9kdXlcfS1ceI1lceY3oCQQlz5yE/k9MBMcRWDhcDhkbg56Yd142Bo/Q3pTMlr
	 p6YCNiIpJzb7NahmPwu2dKo4jnq2VJ5DOlmhEI1mejYlHLjdfY8WpcHd8bdKW1G0aed6A
	 9fuPfYvJPcHKGjb0kHRN0hZzCENp8kiWtEkPF5jTEmp6Z5bV9LrkkXGciPopAwrhl4Dem
	 evDZ+Ufpwyj4FFknnLrsQAPvN8z64VDZcUn7j0SFCRSp8FBgT4rva7dJiSPdXB3A357uv
	 iRMf1WQwa0/axrzjuz5klHi39+OvoJSdtHvb8vhh1/d3cADeO7Xoqn2YphYaWhiG8uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ICc+l5m+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crheO8V7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73FC606A321
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E73FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ICc+l5m+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=crheO8V7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8AgFal1234310
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 10:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2y1zP+2Iv01LMq7qQF4cYVebYl9REU89f4HGpMK7Ppg=; b=ICc+l5m+pY5tpSrZ
	ImKh3a/FI+7u1IUTMilvwcWXcJikvmfDnarNobPEE3BQJ46JVsg10TFmSba+pQOS
	bP9Rq2nEbjyb3eZssVLssBjtNCr6yYuF/7SQZRzxBp7JcPibY4M4V0L34aLzNyZH
	EtYEkRfQZQAqkfkgOyc5Ja+Du0/zxrppAxJD0SgT7FKgEZcO03r4xedi8Elkl3Wg
	K5OMAkRVgqyRN9dki4f6wxQTKOgCNNABTi4EZDAQCR0js1QxVh/c0yg2gdd1ITEX
	pc0zAUIG76I2H6AI2G29MXhg7PgEnudVc25K9dYlrOeWazdoLkQjMBwYehTqcU61
	nXvsEg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnu5t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 10:46:10 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-677deb12bceso557017d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 02:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794134770; x=1794739570; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2y1zP+2Iv01LMq7qQF4cYVebYl9REU89f4HGpMK7Ppg=;
        b=crheO8V72pv1eNoxlcKXpqVcZY0nxLMKyuzVkOU7iEY539+n3Sxw/RyHsXnzLNgB+w
         B2cqYXPs/Jm9W4IXuKZTuZPQT/zoTqGHrc+CrcbRLExWoHFoASEjaPmYN5Qgef+VORtD
         PObzITBNExXkpF4HFDbD+cGOdVUiQPnyhcyBYm54uqumQ2+5l0yAjrK24cqo86WRG6CD
         pAtrWRJlrgHO/nnHVxyz+EFh5IsjbQe7x0VOWgiSF4wyflrKIFrUfr2Y3HVA4e2arllK
         aDQf3rKvcpeirnsKhdZbXXd941jjTiR8RwofH6ztnk+fFaSkIQT2KLGz71wBD4qL1LBS
         zoqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794134770; x=1794739570;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y1zP+2Iv01LMq7qQF4cYVebYl9REU89f4HGpMK7Ppg=;
        b=AgryKnjbi+G2RxABKLsblWsxBVbMZd1loFyM8grLIHJlCZ0bSVXZF8n1BZ94sBxhOK
         F9eGXCDoX68IXajdcbxbToi2r3h9ieuOBC0S7f0nJRjcrHZ2f4CIW6dixLBGaEsnKXGZ
         d0kbxUaNXilP4vLzKVujPkwx45OEOwu1Xugs3vX0ziNhQ8F+r516OWMrFoSDEyZOkJNB
         nBqz6ddp7J9gTpQLCtHosFYqRdi7snFJYlVtU7Sl0ZlzOo547gG+22luN1bIMKlnarNH
         rP9mVDvQm3fHVGdtdCxNvUcPf7HycIIi/Ay2yQEvE/oTOOPdVGuuEFU02cj2Sh2QyeBo
         DcSw==
X-Forwarded-Encrypted: i=1; AL+hErGX+wQWJhUWZsyBejQDLU7ayBFLqzQIivCEQNFXol1zGL6o7RKxAjMhpJzsIUxVKpvWqNB0JE0MmN9eExA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZWRdNN2HXxi0nxu/gNX6OfMi3jggeti5y23afW6fHNeSws2HO
	woyNDcEcMi5Sr8Lw/Dvma+3SkHjK73QcVLfwhrkVhZ5rg4iq+m3XWaISDTsKTRZMjdBSQV/Mieq
	I2d+UrnUyC+qXbMlY+eX+UJZu8f4GGqfpIEgMGPeJxmbda3dRdswHW7+9wW8QBZo5Htg=
X-Gm-Gg: AYBFou00tkE+ljcT8NIANOEM+0Fe55kTMft9Ww3Qd0cRhxQhkC1OwhXWTGsZIfmMzyR
	q7trmr3/amuz/3X+Zxp2I6Sx/aLlQpR+Ry4mitRMwQ2r1Btu1zxArZ0zfNkmENEBSBgG5CHUoRs
	z/MzmXsOZ2DbPChEIhEZyNCkEVb9NrhDivOdVf2JtyYIYXzV6c7Ucc3UbpjOS/DZfpkYCPSW+5M
	6WVWtSgMbny9auoNAWxIyuxS8E4vCm9LWWc5ZfPx6jACbwqDmgUTYEtC7apikqEjeuBXOIX5LuI
	F2DEcSZ2U3waAT/FN7SXsciTX39/BmlCyVidUfghH1Jf2H5Hpm30oJIsWvSyDTqnR43tH6PRGav
	i9lFN0nmztgQ6EjmKHRAay/8+rXi5LkyUyYKrAb9HiDdvcRXa/cFdkwqLbZvavXCnLnYahjLs53
	MnNRt2uVWeEg==
X-Received: by 2002:a05:690e:134b:b0:67c:3162:810b with SMTP id 956f58d0204a3-67c3d7ccbb4mr694349d50.4.1794134770009;
        Sun, 08 Nov 2026 02:46:10 -0800 (PST)
X-Received: by 2002:a05:690e:134b:b0:67c:3162:810b with SMTP id 956f58d0204a3-67c3d7ccbb4mr694343d50.4.1794134769325;
        Sun, 08 Nov 2026 02:46:09 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bb45d0asm12198977b3.9.2026.11.08.02.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 02:46:09 -0800 (PST)
Date: Sun, 08 Nov 2026 05:45:55 -0500
Message-ID: <db17b70b6b6e4da56513d8886a5ef51b.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Radim =?utf-8?b?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Zong Li <zong.li@sifive.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 2/6] riscv: hwprobe: Report Zicbom and Zicboz only when available
In-Reply-To: <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com> <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-GUID: ERGLrmWJM47dA1A-gmgmVho92qg4vOk_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA0MiBTYWx0ZWRfX2nEDh99ixp91
 MckafjvR197/lvPEnzFxM3RzJQtAPkOwlghP4clkJ3R6kf/Q4E4McLmT3sdgub3WIMnS4NEs7pk
 h9Lj+K6ZHG9m+hGSFna6VTaWdTs5Klv5jeWGuJkcMrD6GP4hCqNfbNtYYbUI0hx699gos8qYguH
 YID+rM9kg3ooKi3vCdX6vnTYFSprqwJSl6OUyka/nuXwB/SPOHnpcM1/lcB6yKa1rFf4HFpcVf8
 LXQ1ajKkB5MeuTYkJ2NVyJxQVHcKpbdHwIHxUXg/JPWcqo93//0Si5y4f2lDsbDNCR993CUlr8S
 iJHauvzpBfeIPuBqDoTSuQpT0InX9Qpjlalb+ng7qC0FV76nZJlhifFybhRySLVKny0FhdYnFGz
 HyAelG/fZ7vH4O5jRu6EJiQiv9KCvRJPSjTuO0h1+oapSUSO93TltcnAF1xc2AQZfNjUs7a/3DM
 VXD0yKSWdNfCtKf4QZw==
X-Proofpoint-ORIG-GUID: ERGLrmWJM47dA1A-gmgmVho92qg4vOk_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA0MiBTYWx0ZWRfX9opCpUDSKdK5
 /H52nLeNO5apxn5FNIfRwAHI+GEWwQP82cdoeznuuAKaZIt5Y0lx3Fd3QraZhZntjJkJPYXBQtO
 aq5aZCRNMpJI4zjo+oEZM97gJlshLho=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af052f2 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dPE2jY588YNDLkUElm8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080042

On 2026-10-06 09:52, Radim Krčmář wrote:
>User-mode use of Zicbom and Zicboz requires senvcfg.CBCFE and
>senvcfg.CBZE, respectively, which we set only when all harts have the
>extension.  hwprobe reports the extensions from the per-hart ISA bitmaps
>alone, so it can advertise extensions that are always disabled in
>user-mode.
>
>Report correct environment to user-mode.
>
>Fixes: 1b57747e978f ("riscv: Enable cbo.zero only when all harts support Zicboz")
>Fixes: eb1003970940 ("RISC-V: hwprobe: Expose Zicbom extension and its block size")
>Signed-off-by: Radim Krčmář <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>

(Resending: the first copy of this mail bounced from the lists because
of a corrupted Cc header.)
