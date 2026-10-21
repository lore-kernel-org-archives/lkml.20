Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575771;
	b=fmRNFDIibHsaxsFOpBa41tQ0bCPCJgCEM7i6LJ2PlZKD5otf8LM7TUyeDmansnheGjX2
	 2K4zF0zCkHTYRqVvc5YGFXWieFVSRt7dKD5MjD1DBjFKb7AbrL0vQpkk4lFL825gN2Jwr
	 67fJMItFuJ3Yn4bKZE8h1pvokNLEcvXTqlAECApZHbQSALQxLmRtAaEaQJOFkITb+qwnT
	 l+swYsewSXCo67ri49RnQFF4rPEX3v7WvEWT5sS9A6PjnF1pC9Ko284se81oeHlN3Z533
	 P/LXgLcYvsdGm4Oadga9qPambWDpfzDWl6iDIs/jyuQrdUA8AD3pyg96YrDxYif5VsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575771;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8fJ/yXSpYCXGKrYv0skwoNK5teRyT+oGl0hZOgBvEmA=;
	b=xJ+qvUkj8HZcT7w8Se5TnXNEAyPhitsWKYjzc8NKFupR9b/EQ2q9ESjRENCIU/2e0lEd
	 dNngfa6Ug501mLwrEh9+QhScckEP/S2M+3kiru5SSHZk9Se6DRCN2trEBAsKauW11cdLc
	 kFOBSQ/J9CA6oRHk9nblN0RXLCcIIKktTkbUJwYFRFnRFGphMFObBldOniEmeHxFnhX4s
	 B7EIYGivhE9JboL/6KkcMIEHlnurfTImcNa2KVtKHqk74YHiQ3pWkSGk0LPOOpmiT30Zx
	 L27+/UPjM7uoI1HmDeEjkFyToh/i7S8lI6KVL7yfKrawwTCWHRInUa2DPdmDAHTswhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o1H6an7I;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y/tnfK/7";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42072606A320
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42072606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o1H6an7I;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y/tnfK/7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L9BlKt213252
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8fJ/yXSpYCXGKrYv0skwoNK5teRyT+oGl0hZOgBvEmA=; b=o1H6an7IgfbBc3Fg
	vlfoXAvTUpDuL1heAhVDCh5wJLq515VeQ4C5NUWW6fe5lxVJyeTtxtxtKlPXyx/O
	YVGaYp/IE5ZhQqcGhvGfJXBkYdgU0DQw22OKPOZrfjZMuMHAIRD17Vfsn02TfLcl
	DwLAsAbanueZvBdXMkCAfWij9RnXQzDRlv4tDampmgxXKtgRVKu0yoBouNqCP4+2
	IB9lLlHrr0ge93IT0sxURWemRfLcw+SKWwgxqn3Ai99bY8sBjcKeVBYENpMr+keh
	IclkpeNpj1lO+QeXatCQ/hfCunZ5JibSHaP/GCa5JcXtxVwTFoaNpGAPwE4mwQWH
	MCGJfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj483ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:42:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so168989685a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575769; x=1793180569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8fJ/yXSpYCXGKrYv0skwoNK5teRyT+oGl0hZOgBvEmA=;
        b=Y/tnfK/7lfCN2XLlXgVa62K/eJgoEyD7XuUT0jFWG1lgcsTk/859vKvkp/0RFPGZBZ
         x76+9UIrarNnB3t3sFuO7ZlMg+YOUPRlf3TmjunSZE7BQ4H5u+kKqLbNYFqxhYsRIlgW
         JT3qdVXZj/2eVuudoxT/ZxUYf16jlPxuth20Ngm8EHhcPnmpbhijGe+SIKvEYBK+2v2b
         9J++nFi5dJwM/PEacEFDWeKREmQKeDykfmn+I0GzHrmLmfNTlSo81vn1yDy4zXjmfR/q
         +5ki7uHFrIuXi7VWqgo8EUJCtTT4eUTJvnDwqxuAdZSEpzFD2LgMrnqs6JRXj+MyuO4E
         /kCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575769; x=1793180569;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8fJ/yXSpYCXGKrYv0skwoNK5teRyT+oGl0hZOgBvEmA=;
        b=XAs8lSYJE5zCCPyEeP99yta7gKLn1o5gtRjHcjhl5mQCfXcRP0g7zagBoBTqXi4Uv+
         a499rfZlCHnf1vC5Ll/KT4Hm0dpsUxCBvRJDHpW/Z5TauyFc+VVn7WGCjNyVU1X2YooD
         qyQ2BzlBHH3j1wTTwy5FSqM0QGUzNFJt3zFzfqFZRpXtXIzi7w/WXmFrv0T9cn4tubme
         KCyHNv0g4sCwrEG3yB7A2oVWI+rN64KFUru/EftUoaDUOSwB0RXXz9JU7J78BaYx9ZJ3
         zgIFVOEz7tvA79U9aPVCgw+dcyqFfi22SKfFYyuMafv1zHjcishnHIP3Y0tiVqRsmJRK
         j8mQ==
X-Forwarded-Encrypted: i=1; AKwUvByS1yL/HyDgUmqa5C2l8QYkrPGSezD+PAQASouBIQIO9dRGI5rw3Uot89XfvgvfhJDsRDY0PW9MOEWgS6M=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+9I8EvQBdFBGL8gUsMApJQKKON2OCH+Ft63JlYDjnQJ+i9w4I
	/NOp8VsxjEN+uno6/kbMIJCHrBN7TgGTPfu1ku9KRQ0WijyMv888g26ejvVp3L6nv/3qaHSwP3P
	mcgrnRR9xE5dRBBxJRMWOHMQ3UFaqFQFGJA2V0DJU6f4iC3gbDtaKzxwc7Zhot8oo+sM=
X-Gm-Gg: AYBFou2eYpxuPIrhDpy7RtajypToJ5nNciY5fVQrPunRVUVE+nXyyMjQwUGpodoUlCX
	EHhxqYI9gIKXdPzyo0Iltks2aV4WChxOM31d/TqzZHDpXHqhhs7S87T9gI1hLk1VK1IT8iLv5nn
	j6ZQNde75himb8RX06+F9sQ3cCe+Zjr2PEHfD6wsNU1SdPiz5I8z5cyOplLOlpiB1tE4ukulhOb
	ssPWVQ6waOpt+tk69dcXlgDbk7xtH47FsnxX1/ck+A0HzBpwVE4SgojwtvwlHYJlKlvZM2WaKOn
	xDYtVQfomNKn2VMVKHDFqka6GM+sjLPclGsm5CtcJWDiRQF1UCfobLzm5lYFdn9LMD4GYTdBME3
	ZzfM15GyF7b9iN9vyMuEAeuIaV9k=
X-Received: by 2002:a05:620a:438c:b0:93e:5cf8:e5aa with SMTP id af79cd13be357-93f57f7fea9mr333178985a.61.1792575769492;
        Wed, 21 Oct 2026 02:42:49 -0700 (PDT)
X-Received: by 2002:a05:620a:438c:b0:93e:5cf8:e5aa with SMTP id af79cd13be357-93f57f7fea9mr333176585a.61.1792575769018;
        Wed, 21 Oct 2026 02:42:49 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a200c1cc03sm7189075e9.0.2026.10.21.02.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:42:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: sim: constify struct configfs_attribute
Date: Wed, 21 Oct 2026 11:42:46 +0200
Message-ID: <179257576412.11941.8262591385474559114.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020-gpio-sim-const-configfs-attrs-v2-1-ca4b79d2624d@oss.qualcomm.com>
References: <20261020-gpio-sim-const-configfs-attrs-v2-1-ca4b79d2624d@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RuFGxZLKvssGGUZWxR_0iV4yUXzJrqYb
X-Proofpoint-GUID: RuFGxZLKvssGGUZWxR_0iV4yUXzJrqYb
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8891a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=C7DGWjJ-WdxfBjvmcCAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX8LaRJokHfvJq
 eg6M6PzjMpAyTgDxjsfbEK4/rdBvsw2gjI5hYpEP/254Em2tOTBmUpIVr/hw4fPpjNRP2AbXXlG
 PKLGy72mdqK2bV04iTWlxtgWIizR9Afd+imht10Y8wFupKF6KcjQlYX5ZHh/6xwV4LwaDw90Jvc
 AEhQxbhpK7jIHRO3cBCC5oAQwCn1k8ijnCGBoBr56ePV8y+cCA7Dhp+noG6CHlqCi7GhJvNkRfm
 WbpcIKFWFBVR7awzbFPTW4bf6LLKVgrCbojSOqst+dJwInzTh/gRIl7qcccuDgzVamuWGO74O0/
 7dmH0REZVcYZR1AbPoXXkdW6FMCMH8PGZJUj2X1J3iDixl7RtJzdLWeE0KHRdFrOHMh+e17lpnw
 ybtZ6y0TKVtukv0L3XEUYdcd2e9mB9Ar3YVNq5TZkGcmQbg14EjsOVi8PK3gkTjeRI+DKrdZlF5
 Y8/TK8rK5prabNrvdYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOCBTYWx0ZWRfX99FDhQSrYKkf
 UURW/wHapW3zZxax61Mn4wjuuajGy5udG4aI00Un/NzmS0CX44s6Jzet0ejLLL6RDVOU6SbKSFf
 XWWrmkc+oJfOLaN2CTXiL7ujma1T6u0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210038


On Tue, 20 Oct 2026 14:39:23 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-sim const and
> use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: sim: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/b57f502a681296be357e5c9dc72b53b083b26472

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
