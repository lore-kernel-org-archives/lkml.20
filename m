Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794433789;
	b=VmVmxdsMvV4/1qp9aFdlULRPsMfW0PxgCtt2V5bgK13SdInYk1Ob71km9L7dhigjcPIr
	 Y8kIe8fv6UCyfbqysWVxKUMJUh5C75CRPovd+a3e1ZGqW7gujK9aRW6rc1c7DNJdxKp5Y
	 hke9OUixqd6LJAD3Zi0w3qdQ98uqrBUWPw9fFHD9NSr4FGHteIWbOVzVozlq0oxgPbKyP
	 77QFPdHRvRNyHJfKAWipGQ99k6EKDsvaScPTkX9AulZ8pPtFDYhSSY+euyo8t+r9lqUPv
	 5xFW2GnpXZ52Ssit1kCIWeZyqJxcEpCiFpDUQ886rxWhxNpjsUFd6Rlt5QwoloXhjSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433789;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version;
	bh=5hjKfboVBJ7OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=;
	b=CBGtjj4sIFugGGKVypgUSQCqjVOzrmXK3dvDkdAqOs83CuZGquTod3gG5RoR8HHFXeHx
	 hfDwq2Bvrp/1RP/rTA+LAJtioPzMIqL6L92OWbXcAbqGWRG9U9SN2zFgXfk2QAsSptcAt
	 CoNwzUbgHcKUwnfX0xsgKnPk3bs0gmgsyELhUjT5pUZE1yY0lOP4prOR/sXNQorXEYSgS
	 VzXj37sLBK9kPWUGztSGjUEXi5UBNTMWBh5u+vkUy/53HwxPzkOhltbvuj7NGpx0vU0Rn
	 TO7uJXPnWhWyDrMM/Q+Ri4WC9aUa98iPs/2nXzm68HWFL7cKXpeRW4zMgwKukAgAYRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=GeyeUFFi;
	arc=fail smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D32606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6D32606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=GeyeUFFi
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABKjqFZ1606544
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=5hjKfboVBJ7
	OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=; b=GeyeUFFiqCEKPkYZuQ6WCtcJ+ir
	veBlhkSCp2XR6ZvVC1Xnkgk73qpCo4mRZiSx00pz0ZaPhEttkWlhUPmxfs40TTQ5
	/X8zBYWeMo5qo2ppLp4+UZMJyHFMoiEX2DHlDDezkJ+ymYQXutBVAG3oQhntG9hM
	ZVeerH9U4yDTyfZo8k5T3RGORiWlI7Sy4seS228sgPILhH6xhQjGBjjWZwg6qsn8
	Vlh4ScYyoi1E4wMGavc4pJXl7aCS2fuFIr3busZsxl7CXn30LOVds332fP4+nkTl
	nDWVNpN6J2Xxb3bHvFuoJ6S2atc4WxsC5TivihwZ04AgSP+XyPVs1XTkmTQ==
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hv85sjmpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:47 -0800 (PST)
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ae2756fa7aso26690365e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:49:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794433786; cv=none;
        d=google.com; s=arc-20260327;
        b=OUBBwgE1mLahn/D9uxNF34SHMCwAUDWz5bP61pFq2Feh3ypSNlpZe+wQM2HGRdgf/b
         KE7MpKQnT9BCiOHONQs4Kac4AoHeIcMkmW2U8rXJnDCJm3Nh9uN2k/bjL88mGopD6UXZ
         qHMiA5aWVmZ28l3gIhFwJ+Ra+OsfrWrTcCh5JNqpw5oCgEzjZYqai7KhRKpiWGA6V2BM
         i0iEfEyNUWoG7bPjOCsrITkU+/A/l7Ssuyr/Z7P72EWGmPI7G8hRHikUCvuBlJg2K0a9
         qpwoGIZn8/P4/ayiTr2Q6u8dgAVenPxzj6J5PL3xasan9oWy/FHvlTm7ro6hOvTa+icN
         OBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=5hjKfboVBJ7OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=;
        fh=uqS3hcocgQ5y9IOwerzFCZ/BQjxzDjg45DrhVW0bRDw=;
        b=l0iuAg7uL1If9/kYrzRRhi4FfHCZa/17EMePddI/9anSiXTZZSC1m68ND7SRWUggUa
         cjHCXLaSbULPtLb9iTGeFsc812RgKZwq3aPZ4dVRQWc+W4VwQRRaBLLvNYkNwT6qqtRV
         DmX8kBwRtG0p5N3GiyAVhVaU7pyGz/w77W8iUF80/cmY0i0XmrQoTs8+SpsLv+7knozv
         cScvxsIyp+P56vWSJxbJ8ZqhY/+2s676VBX+RfrEqqbumNiJO4yKNCC+mdSve7Md7nzy
         JMTLwIIEo+fF83WAimRUqS0MMwyRkrlKCfOgO4hoq0eeUXFdn7u+w+KB/bXzss+pegGC
         QodQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433786; x=1795038586;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5hjKfboVBJ7OBGDq8Y9w5OdAYwdgZTN1RE/HZ7spSHE=;
        b=ohBg5vAeVBTwV2ECsmYqz0cyCedDIFZQaFVN5JbbTMClNtShXO6ujVr5dKuKKBh2sp
         OeDJ1/i2x6R0abAjNsF4uf6BMKWE/+fN0+LUchVxSz5qOyoNiLOp1HnwMt8lkMUUHTZR
         hu6X5UurHdKuyGLrxtaoT8cQ1FEpJVYZbn2W2chW77SQ3ohmnkHn+r/j26rKDRpXEPg2
         xApr4dvTHZd5oKBd8/urZpXipY+bPlzmJU5Tg1i/D4hsW41+/uCs54dr3DYEhXhmyuES
         YqNFCNO645GGWmLl1Y/pNeVm+2OmxxUUocNCs7xmRsQzV3VJ70oGsgASxe0nzvThKzQr
         8r5w==
X-Forwarded-Encrypted: i=1; AL+hErG6u7QJCbS9hmghTLkQ7ALEf/yzSP1+hHYI2asbXlomfaCZ/hbRVZtTFxjYfs72T+wS40/+HPf78nuBWU8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YX7LwsefvRTSz7tbiZ/9MotFpDHN7iWLncwZsJnjFBNZRHeXV
	jwATH/ZY5tF2gco63B4d6wdzV+NoD2A3rnOPB8ABNxMEF9ERS80heD8WjAj1E8oTcmiIFW1RI1k
	QJnkZyYrjfFJfzq4hgt0FiqoCqBfHkpraf5lEY2bv7Xi7Iz93DB8xwRu0D5VHF9J71n8zRzd+dX
	eSSXHMw3TM/qiveZcZT8jvuEE6CpBesRliZmlozas=
X-Gm-Gg: AYBFou3MyO+yiXyniipkBYgljlM/di0zf24qihaJ3ooFGFDF5xbNRXSXCBMYMe1LZvK
	g5TrQc3s83uH3h4RCN4/3CW5SH0DTfk5tKJYFQWgDnXZzhd3tuPvPyfulyBqJ9xvnJrv2iIbdkk
	ZsseHBzfre/Di/C5McSo92pX9kkBwPDuEUXaBR9wllPcwwyQ2SUEfvfhwynm6eekv3cP6QpoErp
	o9NT2sLgCbst51hbecTiKGOFfSqLCXS
X-Received: by 2002:a05:600c:34c7:b0:49f:e701:51c8 with SMTP id 5b1f17b1804b1-4ba093583eemr60183625e9.9.1794433786463;
        Wed, 11 Nov 2026 13:49:46 -0800 (PST)
X-Received: by 2002:a05:600c:34c7:b0:49f:e701:51c8 with SMTP id
 5b1f17b1804b1-4ba093583eemr60183425e9.9.1794433786168; Wed, 11 Nov 2026
 13:49:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111005533.6436-1-toddfreed@meta.com> <20261111005533.6436-5-toddfreed@meta.com>
 <DMSJB8MZZCXK.MCEBRZQDAM5Q@gmail.com> <CADh2yMx8MPjcH7Bpj72rNNd_tT=6uSC5Ow9JyGjTMjFgs499Pw@mail.gmail.com>
 <DMSM3RNRY412.1GXB07F4KGJYR@gmail.com>
In-Reply-To: <DMSM3RNRY412.1GXB07F4KGJYR@gmail.com>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Wed, 11 Nov 2026 13:49:33 -0800
X-Gm-Features: AclHuK_3wPHrs7nAKCIlAv8DB3IRwLLgS4civoUiRATHWDoZevdks1911kjhq28
Message-ID: <CADh2yMwFu5Gyadm2Y-NHCBtayEvN5H9LUM=Kf-tT69vmjm0DEw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/15] psp: add support for socket-less psp associations
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
        Donald Hunter <donald.hunter@gmail.com>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
        John Fastabend <john.fastabend@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-rdma@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Simon Horman <horms@kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
        Wei Wang <weiwan@google.com>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 2aCBCjVHdElNnEmEoUgiAf7qCEOtRqH2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA4NiBTYWx0ZWRfX1Z2eWwfizJ0N
 FRnoZ6CmM54wJJ5JlVLgVRLzmy8H8EM8alup1V6XrVRMMWUJ0uAZ+Lwe2dUA4tqxEf0/hAk2kHK
 I0P8OcXfXnywjpRpHr3Z0Vz6Z7kE8tM=
X-Authority-Analysis: v=2.4 cv=RsZQvymK c=1 sm=1 tr=0 ts=6af4e2fb cx=c_pps
 a=Ech0Gv1thIkdqUNjVc2Ehg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=crHB47gyY4rKiduisYu9:22
 a=VU9VbmEmTQsFja8ue1gA:9 a=QEXdDO2ut3YA:10 a=cZgK7WzY9ta9U-6s7oqD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA4NiBTYWx0ZWRfX+HbbqhMDwBX1
 G6fL731sdOGwOxpTKl+iwDqt5Jtqcgzw9KItq771RMOyR716gbIUxn4JWjFyqJYsiFU9KAIG2+z
 eEqtXk7VpNxFc0O+v+/3d0Vf4UCSCRSVwJ/C6yJdyenvlDUd1/WdTKOMBiBbKQL2K0Vw1qc9cgV
 LHV0GgTPDu2Ohz+cwRbiMKWxmbO1+o08gIhjbBRYD3NUMtzixuUPTYhAn/jTlf7wfQ9fvgaSFxl
 c5MklwLlqJiXfU8V774V8Tz0Th+tfDx9sSto9b03Tc7jVq5VImfRGqYjx/YeVsIZ2+mrCZANzPc
 tz6XQWBc9tSMuxVRYPRK5o7cTk2Di2e7adhi7YOfD76HlzspxpXefPYSCNAtgXcRJRmmZK3pkhG
 kd9QrHM2gr2FHyMr9aR4afeMg5QS4GxsEMnqLytcbRzWQ9SZnOvGv2T5K6IH7wNEevXLmGOnmjM
 bgKQYr+yWNH+ytOLcKQ==
X-Proofpoint-ORIG-GUID: 2aCBCjVHdElNnEmEoUgiAf7qCEOtRqH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01

> I think it makes more sense for userspace to just get rid of the rules
> before rotating the keys.

Ok. I will drop the rx assoc objects. The robust userspace protocol will
be some combination of using cookies for state recovery from a rule
dump, and using chains to flush old-generation rules at once.

-Todd
