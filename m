Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794318197;
	b=3oA6DR/lZTIQ+c5fAhkNgo2IJO7BCi1ut2uGOi7OW79qDWb7dJqPmybANscefCaJaoZi
	 MOE3jjbY1z8kIxZLZ7iP/MuwGyYoZ44f2fm0P5DqhLtjU2puRSbXqn7Ixz8wemfz1i5oz
	 Uq0GG3nOLE9LcPPTiPjGtRNJtxc0o8C+Ycfr/a5pDtc5mHfqm0igU4p1r/Oqi8AjA53L+
	 yjEuUe0xRH3rtamm8OM/JLHc0smCbTYcXnIjizZ0K6xGM0ilBaeAzSHVE6XTXl/imC9JR
	 JWFmZGSdkLooD/wViSf3JT508qhggi2yabAr0Md52ssg3VPvsDGfYsx4K/Ic0mvgBYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=S8dLlgm0BL+8pRjOClw2hAAWBHdyZ6f25O6El3Zjkuo=;
	b=znZKedgSJKOc7N9CiY7vRxIZGgMkn9M95c0GIisv+B1DhkSNdfHNqxhqTLYsx97gTkUM
	 blL387L18Q9JiKrfH10xJJlSRJtda85N7ownR58tkw2TUf1aRxfxeIZzlqOSw4C2jaH6B
	 6hw4n3Z8cfz+jWR7Kkbm9qQWbRYtPO+2smFcDKRefb3baLx617qqnNtBdes7biVQRWIRc
	 mAkLyhC6j9qKZAg0/sDgY8+Qr0TB0nJxNhL8hbZNbU9k8hT9rLpLmkIVjLZD/6KC+U/aR
	 kwEo/C8WrnbS9MjWxO4I+Mia9pIlN3bnGm+pj2gLZ0OQUWpCVdV06j2m/DEU6XOH0wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DVMuvjEu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PTK9JzsF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE280606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE280606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DVMuvjEu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PTK9JzsF
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABA6TL3217027
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8dLlgm0BL+8pRjOClw2hAAWBHdyZ6f25O6El3Zjkuo=; b=DVMuvjEu65KZkolF
	cZINIYban3cuQraNxZGcDb6ICiHTmbJMtlbmiuBiR+xMSs3hfr9dj6iY71/j0PKz
	q0Aaj9/snpYUSgPMGHCoPLOHlGTDxhKXY+ZnfHF6G47GMkxuMHLfstL3XU0qGbE2
	1q/RB5mPctMegyTHI+F4Tem3guN+gaqLVhRdHwAccy9YEqnvlH5o+4IA1n8ilVbb
	qztFHaXNackneVeL0nBx6Ap4w5j+oyW25kVxvVAF6DDHWNWhkbGDgmrETm5Xn00W
	0Jbxba8NvNJ0hJy5f+rTTQeH464ZNt1w6x/8Xyw+M9T740D4AOoOPH2JJ4UTb7Bj
	PvIfzA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huvtd9vpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:43:10 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-677c4ca22c5so4143779d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:43:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794318190; cv=none;
        d=google.com; s=arc-20260327;
        b=FjrBzDkqUgq8LVI09PltZfTv2LzvbccXTPrAjsj/mqN7mpA/ICdOPFlEbSf9DUkMM9
         zomu3wA4Usht+zAcXLRCDzmqz2q5UVLyYEu302nx2t5SCSjM8koASeoa0G7mfBi3Lfd9
         dQGaoUjsEyKBVikknerINuvvrZxxEoxMyGHm5W/yxWqI33DDoGof0reOKeL2gKYWFUmh
         2Z2LCpEXY/aKB4skqci2rQud/w87A1rWZUqyaCVRrOpy/rqifxqsSjmSZn3ru8qpD37Q
         BnNg5zv1S1RJS82WbNtNcTUIt0Bemawy866xaNK9lE/Fina6eo8GIbpbG/PEKVe4pQWy
         ze6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S8dLlgm0BL+8pRjOClw2hAAWBHdyZ6f25O6El3Zjkuo=;
        fh=dPlSIIs+croYMZbfvzcAJ9xca4WAGXO05iHfMeY3Hog=;
        b=imcv8dXJlCfrRitixzxTSao+N0mqXxZnXnZHc3hVmz5OkvqKFIYAF/RjW+SINCIkKS
         nIgplwWWveN3n4ue4QysbYDlgbwh9dG+z+o4cAJIEz3/hLF1wEjDXRcPbpE61BYprbw4
         036B3OvYmU5EaNSLv60aL3Z8UbWwiqIC6fz7CFRpkMezeKqBL0A5pXox829OdboJRYmm
         29AtJnMU1AI+jP9Mn0F8LKSn13/7VaxN5NxFkR8wnDw0wMhhu5xUwDI6juQT9JwW7djY
         uPMTMZLHjeAeO2TMulT0YIp5+HUMFJd1Mo/MezBnmmJHI7SbiRZsjarD7oVcV7Vc8TM9
         je6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794318190; x=1794922990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S8dLlgm0BL+8pRjOClw2hAAWBHdyZ6f25O6El3Zjkuo=;
        b=PTK9JzsFSau1ErdLGjUaMDUA1xCDVso0YQzJT3U8w31U1xsw6uxBUJOzsz+08Og0uW
         zM5fslFF7isMPBWzYfkKHMKUkVCNPfnig2GJGSCz60thV1/fySNS2kR3i6KQ+fFUfVFV
         guWVzZX/K7iJCaVXMYXPG2kWuFPxXDQU/4SAK76DBylQtRVYgt3zHRKaPjfE3dg4k27O
         vCh7MubqHyZWbjGwmttbIghJvrrxbUK6yrCoDbVOJC9kloxx/u32o2sbf8QvfvVdloEk
         mmGYCLpn9GXL0SsSZCTDDprFP6xn0FgisvykaSR7SlcBVmyaU30DsKttgyavFXwJafZw
         X7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318190; x=1794922990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S8dLlgm0BL+8pRjOClw2hAAWBHdyZ6f25O6El3Zjkuo=;
        b=ogfo91gUG2WihfvczNn3HcHdYY+TbD0is5R01dPEPBy2EQ+WuhVAh7iKOOLkQ7j9m2
         ewmLa5NL6qFzuWk0zXHpDLC0zNX8uSM2+/o+yV/GblQaR6oCh6tVkNpmZlD/UQYMLCw2
         DtK4IuLw9QI9Rxzj9wPQHWLalaMLuMraeVLlg5o8hvbWCZPMFsE4LSmTGvq5wT2+sP3L
         u9KRvr72NsD77DwNjzi3sg0MbaoFrdzZ6HB3PCKtxCIwhnb+sRA2w5wpewppdFaRXJF9
         qotK2bbVQf8qP6AGvKctXBDwd0UN9mj5+OMPGbYIF8/ixSnli6I57OnWqo9JpDSxIDGt
         YxXg==
X-Forwarded-Encrypted: i=1; AL+hErH/FzGaF1KbjdQS/3ci8us4FtKq4gR4hC0t29cXLtOJaDV8I2iWdJBInWOIIFC443E7HzVkc07LRy2xNfs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EKA0wgwKvaUVBjNOs8ca63XYKa8DEKVbt989sRKGGcHQVn2HL
	efiPlKb6TxYo7Lw0RcTQyd/UaGCfiQN4B85IbQE+JUKVH6Bytb7MOhkB7FiM5qam4HjlwzeucUx
	n2lP3yn4Lu/f2qJpL0FmTr3kcdFy1j4cu17JvvHue8b/5MnuzpiKRzbC0z5gD9i7BIA0cvGijx5
	vtIliTvrsQKRPKmXJIiYC/epXk8q9E9990AiYRkxZIWg==
X-Gm-Gg: AYBFou1qArGiqHSDBBrkv05NzD2k0RDHDhnUSuN2v6B31khe6GIqFNxiQCCGZkwHlW3
	6roYyGYSjTjI3bhSRhYguGHWvYBM/LVJk+vTMXdNMsq0L1vZExgYa+zYtOrypcCb/2KtAewVf0X
	WW+MD1guflmdL1pXANRyJMeirDZGfoyUAOkT9FvO75pW5716FCkNjD+nNs7w==
X-Received: by 2002:a05:690e:480f:b0:679:b86d:6977 with SMTP id 956f58d0204a3-67c568b644emr1210425d50.73.1794318190185;
        Tue, 10 Nov 2026 05:43:10 -0800 (PST)
X-Received: by 2002:a05:690e:480f:b0:679:b86d:6977 with SMTP id
 956f58d0204a3-67c568b644emr1210415d50.73.1794318189718; Tue, 10 Nov 2026
 05:43:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
 <671a7f6bda4ec81f56e3eb7ee287bce4a96b9d5d.camel@perches.com>
In-Reply-To: <671a7f6bda4ec81f56e3eb7ee287bce4a96b9d5d.camel@perches.com>
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 07:42:59 -0600
X-Gm-Features: AclHuK9gNUY-5DUl9XxCj9OZHjqpeyg91U7ZNj4UaVgpbOKq1q4U0wiyNr5nzIo
Message-ID: <CADLxj5T36OOBR4J1HGNT3U7H1FwwvSPmBWYRM_vGAEsXfWT0MA@mail.gmail.com>
Subject: Re: [PATCH 0/4] checkpatch: improve exit criterias
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 9iC4ORWO0J9OriYoDoXMepbFZdoH9wcJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX5SgZQE3P4tLM
 dqfXpsMh6s4gTGOqBHmIhessl+0kIHKgRdXKP7SvUE6xWzQICqxokNRhcs8sYsjQiTUio5giQIA
 w7NFxv/m//LFSpHFTap0RwtKLa+Mjos=
X-Proofpoint-ORIG-GUID: 9iC4ORWO0J9OriYoDoXMepbFZdoH9wcJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX+gj+KuTPC3dg
 NJojv8nJYzmDmYgdROL6UBKmDEokTGZp1Wj/KC2oo2IHVzKgGyY7k/zaFAYq+ofSzARIy/c3sK+
 PYnYZzcs4+Y523ZO1asFGpr+436hWpE9Ftap5O0cCAbAGA0EQyQT9xdmAU7Oz3ue+WOp9LpNcgZ
 ipHtlfu2N2563RESfssPmhrHxMihbUUKIKeTfPr0IuUO8ZQ/zCuQH3QoISz/5tc/1xG0lWAmnv0
 Qsg2wileW/Zf7ED8Mmb4r80xjF0WfVSR1162e59x9z+c2W2abfDlxgEySMx8bWh189LkZfMYCDV
 ymVhsqBtOlUgSCfy6tjs/ZDaEdXUBL+OG0gWG4EganJCiWQPBkuUff6B+h1c0jWXBzbfXoD91KR
 15uNfG4prSENFPb/KhRnAF4wSYwpHLOMGxHNGUlxrfVDQWhSAAv2wPuhP5G5p6V5boqg9xoQxNM
 GCy/gWUC8uphhAKl15w==
X-Authority-Analysis: v=2.4 cv=ArR7T+9P c=1 sm=1 tr=0 ts=6af31f6e cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=IJv9LcIfAAAA:8 a=S814grWw63F5jRhWiAAA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22 a=cmr4hm9N53k6aw-X_--Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100054

On Sun, Nov 8, 2026 at 3:04=E2=80=AFAM Joe Perches <joe@perches.com> wrote:
>
> On Sun, 2026-11-08 at 04:21 +0000, Bjorn Andersson wrote:
> > When invoking checkpatch with the --mailback argument over a range of
> > patches the tool unexpectedly exits successfully on the first clean
> > patch. For example:
> >
> >   ./scripts/checkpatch.pl --mailback --git v7.3-rc1..
>
> Why is it useful to do this?

My use case is that I create a maintainer branch off e.g. v7.3-rc1
(now v7.4-rc1), then apply a bunch of patches and before pushing that
out I run "checkpatch.pl --strict v7.3-rc1..".

But this is quite noisy, and the compressed "b4 prep --check" output
is more what I'm looking for. So, I borrowed the "checkpatch.pl -q
--terse --no-summary --mailback --showfile" from there and it took me
a while to realize the difference between:

--mailback                 only produce a report in case of warnings/errors

and "don't produce a report if the first commit is good".

So, might not be useful in itself, but the behavior tricked me and I
pushed patches into linux-next with checkpatch errors.

Regards,
Bjorn
