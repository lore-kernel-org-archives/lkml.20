Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502781;
	b=zJnEP4d9ml4brygnYuXrAetP+9o9a50jlUNj7PuZDwBih6TQdkbYu45XO1F2E8p2S9UY
	 kZm5JHrajhfcyAWa56Xww8gsSxHjcnRfF+FiXCCpGMLL6OqMjP2YBP+0A4kY5k4XOniMR
	 0gXnKUj/tR3gTLUAa9+twqVsBBTxk2g+8Sk0J9dae0Z3wlnLNFCsPODGnIppA1dwuXpIG
	 M3A8r8yXFFkvZW7EHqbmyqqO5Y1sBjQddoDW/T/b8Cgh+oBOHhV0yTk/W7OBFF2Sy5NIA
	 crnWIGCHwJfszWY0Y7+tRS7DW/QycGOTEb/Kv9baiqlVJkEmzfPWxHI+AWXBgNEPKnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502781;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PaW5pQEkT5mohB48XjKoLGf8/2YWFkvULX8VqVDxB7A=;
	b=Jc51Su+WRul3a3EKDaEPbvHKcQ+s9D+d/qyaMTFRzzebnLMiqAHOcnpAOEmUVgEVZP85
	 jx3C7qeOMvaK7mZW3rEHtwxQ1Y+rkE7QxXhOIGJqHxaDexOtoFfShd1oEtzAhuYTk9BfV
	 CXqXwsoENbWFmAhRTT269nHpjuuH/+qEiptJTPfT1FYJrpZOocNx16pnUMEdXE0Xt+T4w
	 G0DKOMezgIUsSWmsvv+LNLYBe8I5TM19NL7kjJRZakMCsR0EWBqqj9PsfYauYlsJOJfqK
	 5gck6fv4UILofv25W9DiCetLnEaLdjE0lmsH9Oy9g3l9FmhM/SEQiWJvTUog0P5eEAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FhjmhN+i;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H/mvXxUQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AF6606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80AF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FhjmhN+i;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H/mvXxUQ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9xPF271035
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:26:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PaW5pQEkT5mohB48XjKoLGf8/2YWFkvULX8VqVDxB7A=; b=FhjmhN+iB8MJmVBY
	xrTJdxO16ebB5m/+aYgPFjCujUMITQK4uZgY3YcE3TBdUaYi1KB/Y6PhGBIATqiJ
	e2TxVMhcmLP/xXcxee6joWZQTkOU/JhmOIZVl3blD+OUKPK15OW22ZdDoZJfiogy
	h2PTZrpNFgZSP6j5hrsBJUrvvEPT9FjXTY7HHCgC/jESNkdi66hecgdmkR9RJmCf
	9Wi0HI+UKkYcmAZdIyh1l3X0YOHFFwMIhy2FHMbMfXkisG6Ao3CRZfCvyod5SVAJ
	9Qj0HVhgPC83F9ggHURksP5EWx7zSJRMFKab0IgGQwAxXGF9832zuSbuXfwEXZjn
	uhIsIA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hv8bqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:26:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc06b9cb33so325588137.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792502780; x=1793107580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PaW5pQEkT5mohB48XjKoLGf8/2YWFkvULX8VqVDxB7A=;
        b=H/mvXxUQ7yG2Gn4LpWL20UNfL3I+UAZYJYxhPT9cCDEzna4z7iRW0017GEsQ0bybux
         cjf7HUAEwtBDw7S4IIJycZ/Uq+s5Vg4k93gDX+ZLrgabcS/17XhJNu3WBNqZe4vK8/fB
         ycXzlfUKEKxK0fS/dUWp/av/fCtajpY8c9lgBbMxJUzHqRo38JfZ6Y9G+xSHzIUIbde6
         icXR+lJLbm2AvcpX4zdNrs2gSkHHjnqYlGV89U0eR9C6lx+T8uGJTvb703ibL8aa/Xdr
         SgWaPx2JFF40io5cbuoNB9yoDmHIeMd6zTuh2/W77qKhIuBm5kw1Ch3maolpZ4ajFxwV
         3snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502780; x=1793107580;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaW5pQEkT5mohB48XjKoLGf8/2YWFkvULX8VqVDxB7A=;
        b=O5Ic0oR63xd9gu/2WdnifLbKiTRlmA94A4B1CIv4W6mapjOfsMrfN34NqOwlhVYsrQ
         nV6DOCUBjzaF+oo+bIaX4xlIygur0SpCSwu7RpVExr05+M8SQSM7RbgFN4lVPFqlOh8q
         Q2FVov2+aR+JGj+IfLPXa0k53xr4K7NMhvQaaPJ1uQ36jybFd5Hek5i9czNQ+816IUyT
         2tHOhyQofioaMERlRkXjqumoIa+v55PqehSlcBAp4u0zqemp+J1Q521PZMqagixNM9Gn
         l+AwCmGJMbyPPRFr74YPPNB7H8TsSTYe6mMYr4hhhZYJrsUm6zwEUGFf5WZxfzz5Awcd
         dEXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdfgZLnpXie+b5Dz/0ADIrIilwanbEMCmcPfuHKvK0Yp76nAUY9f/k4KaAGWO3TdbwC8Slh45sAw1B4mk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7iFQL/xU1CUhNXD2+TynVPwaxBNuwLOkgpONNRXJBobK2Aaq+
	S59YInDlIMXhbOvigHwGDeMZudE4FiVlkDi2a7I+ninoUcf6i/eeJRXj/Tlrfpbctj/Oc2x86RW
	/uYcWzRPf2P9e8VjjqkLMYKTkKTDsWObmFhv1h7kdP+5ybzQeeHKjpfw9BoecsmEswg4=
X-Gm-Gg: AYBFou3M2faGnjDBzQf8Ei0IxFpk8uAYGgK3qiQz7u4m8yxTE6hPw4DWJn/SwfhEsVD
	eiqAh6kyVudBhCPLPXGL5YvqrmNB/9K2Y+TNFBYZmTHdvVoPbe/YXIzB0v3i/IIiE6I/CTsi78h
	9wTanaBCdMzO0/ZucDrHxzjQZvD+RvzdpZeE+sTsrN+EdyNEeL0RVGCNL3j2Y/dmLU+5xfoNacz
	U78u4OjOwyiBhZ7VUxLWCCamsowbkLYWHQPQ6hmuH3aq0iPj+xMctTRjQ3pTSBrGU/thSheF8Wy
	0yOuomFlhlrcEXEe5r7RHaHbs+148DtojBECjNMblfG/1JFBL/QZIKYC3jfpXlOPdBNdPArniGA
	4kXQUK8zFLxMItjmhFR7w4UvvP2Q=
X-Received: by 2002:a05:6102:955:b0:7cc:23e7:e74a with SMTP id ada2fe7eead31-7cc3695dfe9mr2282380137.14.1792502779524;
        Tue, 20 Oct 2026 06:26:19 -0700 (PDT)
X-Received: by 2002:a05:6102:955:b0:7cc:23e7:e74a with SMTP id ada2fe7eead31-7cc3695dfe9mr2282369137.14.1792502779040;
        Tue, 20 Oct 2026 06:26:19 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d1e8ebsm67021575e9.3.2026.10.20.06.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:26:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulf Hansson <ulfh@kernel.org>
Subject: Re: [PATCH] gpio: pca953x: Preserve wakeup accounting on parent IRQ failure
Date: Tue, 20 Oct 2026 15:26:16 +0200
Message-ID: <179250277086.33804.10505496122587377606.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018161042.3298045-1-sahaj123.sc@gmail.com>
References: <20261018161042.3298045-1-sahaj123.sc@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfXy0psTx8Unpy7
 74asT5BM/OECzqr0hG4g7Eg91N7T+dRiwzLrH5EkRQoEMlSMhhruh+GnMIvdGR+Su9BvCYrKzMn
 g6w02WKg+nVlQm/DJ13pwNyqlvKjdHp7jirW8iaTK9utuenkF81KGr+vN6iWFlfK+RqDFK02RsQ
 C5SX3heoMRj3ZwE+HdfCX3XTfn8R5dh1QVaQ0Q7kPIArGBLVVd/VQq6ciTRsbZj73On5F3jNPli
 nzDluRqS4kSLS4HVaJud5udnBc9zj3jWtqkag4ioPr3Dsa6M8jpKfw0y7eu6duZEuLJwB6Zlz8l
 ZP+O/2Nstq1Nv3RinKrOxDZbN9lsI+IDSCGOLC1/V9JEKOTj3XtmjCQhu2TrBGzfkUXaaaZ0sBe
 LIzbAHDH8lzfbT86uH30EnyV8m9pJr5Gr+uSp3Dg5rDxMM10FgKg06ck5WxKTaxJUqo71HKRarf
 L6b1aqAJpk6wTPmp/Gg==
X-Proofpoint-ORIG-GUID: Comh9nRmeK2uac32ac-2XvSOUGFo59kF
X-Proofpoint-GUID: Comh9nRmeK2uac32ac-2XvSOUGFo59kF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX1ggv9A7XHEiS
 tXk/Wobk2HdN1EuIiEdv0xf1LamfVdLiUzrXzyG9wDeW7POVWpi2yzyC1ckxddQqeEG+UG7QcxG
 4gFW2qNOo8eACF8LW3i43FFM0K/z9u8=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad76bfc cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_G_FQYvs2ls0BvL-ThMA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200053


On Sun, 18 Oct 2026 21:40:42 +0530, Sahaj Chaudhari wrote:
> pca953x_irq_set_wake() updates wakeup_path before asking the parent
> IRQ controller to change its wake state. If irq_set_irq_wake() fails,
> the IRQ core rolls back its wake state but the driver's counter remains
> changed.
> 
> A failed enable can therefore leave the expander marked as part of the
> wakeup path when no child IRQ has successfully enabled wakeup. A failed
> disable can make the driver stop retaining power even though wakeup is
> still enabled. The suspend and resume paths use this counter to decide
> whether to disable or enable the regulator.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: Preserve wakeup accounting on parent IRQ failure
      https://git.kernel.org/brgl/c/a38bf551726a21c9bcc001b02164f30378b64b64

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
