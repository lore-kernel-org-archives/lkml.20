Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793123895;
	b=dMTSfRT9y3Rqg05YvQkqZqbhaEOY4vA6VfANyqm3KwTUNuo3WZpiIbJ807TzMdZaE9M+
	 1zomi5HuJvY/pq6vsoTfgPfuXRqwwLDQOjsnml+iTQzKr//5V6sOVv5YoHBBkGpPkhr4d
	 bBo/2a+ruKOXYDlpuXWuGQRjVYfRpiHMCFl/3yc/FzVkTjtGbB5XBpaa1G0msOBPbjdZY
	 MihyKRklabM1pOeI2QVf+ZI7r7Yn8pzs2zVMZgrTHOGw1hDIeNdRdddMbQgEZeCjlMHo2
	 kXFDBuguyIG4j9q2TQ8EZgtLougYRkvUlqqERtWnqeOo3T66XBCwl1XXA6SuuQzc16g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version;
	bh=1SLwWY5nhyzce/BMXQZLOCKP7mE4tnUfLqJlnWOr9C4=;
	b=UwksC5ClFJBJqjNWq7xFDWKCey5rL8aDJfXHYvRavwG/9sMe7nxYkM3Nmi3/ADt/K3F2
	 X/4Oc7QeP4ryY5unidyLj5F9MWVk2hvM6BzbUU2EX0VJE21p4gDazKNLEth0l+NuLMeNh
	 POJOOCKgIt+9tRaXunHvD5Q0aceDrvsIDFRbaCibxWLanq2pnIADZLsGBUBTAtSHEtd5R
	 90L6veVRDiDqrMoC5tzY+xoDQc/uZ2UruUzTdkEiB2RhiMj7O+4YUJ2DjASyCjib75s+d
	 x+3INUFiz7yDgSC26YKSq6SlDjaPQjO71BdzOTW0g/nS4im5IiAIml1GyzfmM+uZV6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=IW8i35GR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.153.30
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EEC606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9EEC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=IW8i35GR
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RGwtAg3138762
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:58:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=1SLwWY5nhyz
	ce/BMXQZLOCKP7mE4tnUfLqJlnWOr9C4=; b=IW8i35GRgMONClqZI2OvdI+YMWt
	lbGNBCfDtJu8Dc/fyucXYPugZHQ8NiMKoVfl37wOvnt1jO8E1i0HqT5KdUOLN9KU
	xzv6eowT1GeapoSuHMktOIYQl+bD6u/tUHXJJAypgqr7uU9CvsbXzTB3tIatCvjl
	AbI2ALTb2EZOdpL+elkTE9SsnhiBeI3nFDjzW4x+47l9XFcO9EmlFHXz1rwzWuuF
	SHS2s+lWCD77gihNNzffxu693UkpGq3Dm5Dn/IoV37REIc9nDbKMbLrDuXzSllOx
	48A8MwWWKGoWl+Fv98Z5xBMaIFaxhn8IQLoo6birj4rZq7EZD9LNbaAda/g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hjxcahswp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:58:13 -0700 (PDT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05c820ecbso234553b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:58:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793123892; cv=none;
        d=google.com; s=arc-20260327;
        b=kMLZLHngomjQTfU1QwiVUsRRevHjze5bm08MfW9jMsWgd/c7h9/96l+D+wJ2ctilT8
         kjNqBG16dh6i5Q1H8BQOcOfGx+/Zsg0DAjc3jt2rB6yCFllJBDXwssDC/YXtEnb8ojoX
         Yhx/WEdoOPklwQhwALuVT3KgwlY5j+hvFZZexoXm5rnaWHTmZZEJIZqdXdbADyiOx5Ms
         /AV8NrORH2oVvdAhKwUgUgaxcqIGZcIr+Jw5OUJa7pEfNRO7ahC6jQnrsGNl4EIjnyeu
         ugXRMIDdx2mq5+sHzbsoqYsYItVtWdjdDBJvr3wKiTOWlN1XaLEuIOtGm0oZkYSMABa+
         QlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=1SLwWY5nhyzce/BMXQZLOCKP7mE4tnUfLqJlnWOr9C4=;
        fh=vyKEmLQT1DxkN48rI9eSoCW/ho93Nxzs/nKX68CMUx8=;
        b=nArTrQBxr17xD8vz8dXVMI5EWUDOUZR5cj1RiT6NglVnIzTAhKMWepDB5jzfegHVTZ
         VdelenM09Qp9KqzJoNQcOShNNtSgspMNhsBvgvzZ7UAB8YBrE928pHfFBZ59DSpuDHtp
         CCx+jXvV9zZGGTauLHK5b8xu9hPe9QKUp9x8heOz4/afwIcPxgYhOcikfAHv8UYDbtA0
         nY2tu2HDnJaXZxKlZRzpDwHuLlWkUP7Dm1K/3TnVVM7LHtm4uMcpDXUZlWhMxJFrZdCf
         K4h3wQflhAQfXZqGuX5QQH+qTPJ9Pwc/nzqJUKnViDNpwbrm7HUXD4roRg8lVF3ad06R
         b+zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123892; x=1793728692;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1SLwWY5nhyzce/BMXQZLOCKP7mE4tnUfLqJlnWOr9C4=;
        b=nCXq7+OVMz9hJ4oleqW17WCZMMntbLf767lgFOX5T/0dV0vn7GBvb83VZ0tLVlY6Mm
         WrLquBvjc0WBXe5L2Mn3E3EqQABrolSM4nTY90M4vZF3NkHZSQbO4JcEmv7TExlgvsO0
         3DxEcWCQYwraukW8xw1NUno/5oD3nhMMF4SWmArTtkrfJyrA6ee++T0lRswSDXT9EMsh
         tqbtjaz/zNvSgP6FjbhqB7dwtDzpEUSF1H0+osrVEGhaetKIagdN2wu5E40QJXQ6CYgr
         boUOvvgDa1Onbfu55P8aaG2vPzfjgACT8da5yB77G5YRiBP25YETT+LAnOKWXDAn0XK2
         4jGw==
X-Forwarded-Encrypted: i=1; AKwUvBxxXJeJtM5avueuqkP58MqefUagvAwsdPabsNYG2FGzhyr4cGwoGq3SU1YzAEgCxXuvafHENh0fKdJUyFs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyDklLQUoKALMyJjLYbqKOvPZvUGkNHsVY/yYP6C/D+gBmteOo
	7GkOFq3YMyIkgwTchJ8ZKxLTM8E4eSmwoCq+GSAsQHKtHLY0A9f4u6dFuKIQDMFlZQjGVN65d2r
	MLg+t/r2NlGso1p4qChDlFlWOYgoWB7M97MT+18kXaiSAU7TToKu3Av0ombAOYmDsSBZSgiKTPT
	xn1yAp0o7yYvI04/lEsj6yk04pR1CobCkr8Dj8EbA=
X-Gm-Gg: AYBFou1MdFsZZB+MQEA9tiUE5dn69Q2nIS1TEE/lKai8NNHus85aUQpTW5IIFfKHI+s
	U0A2CcWorfJwxa567e/eWa3g8TZLuYPptS+HMxb+NQD2xz9wX2T+YJ/0BViMiMwBXcUArOrn3NF
	nKrjD4LG3AWLy7im/ArrbJhWMBa5YtEwL86zakF7ddCsJdip5g5WS/pxSLTiPK2UyAoT0PlNvRh
	MViX34wrNbLcaxZ2CousylsDB2w1ks=
X-Received: by 2002:a05:6a20:7343:b0:3de:505d:d77d with SMTP id adf61e73a8af0-3e90232b771mr13835637.15.1793123892302;
        Tue, 27 Oct 2026 10:58:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:7343:b0:3de:505d:d77d with SMTP id
 adf61e73a8af0-3e90232b771mr13625637.15.1793123886850; Tue, 27 Oct 2026
 10:58:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023234640.1459291-3-toddfreed@meta.com> <179288570143.3134.8925369868949382653@kernel.org>
 <CADh2yMyYS-PWP4912En9D6B9up6Kz-hnCthNkWot+e7N8-q7ZA@mail.gmail.com> <20261026175805.6d4dcae5@kernel.org>
In-Reply-To: <20261026175805.6d4dcae5@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Tue, 27 Oct 2026 10:57:55 -0700
X-Gm-Features: AclHuK9a9sPXLGBoQ5eEYEDdm6r3iIivGDQdeIyBtpGnfGV8DBsPe7nWqNJ4q-Q
Message-ID: <CADh2yMwtF3DxcD4h3zevCcmy5vn9iK8sYHoPrjoFPH5PHuNkoA@mail.gmail.com>
Subject: Re: [PATCH net v3 2/4] psp: support ipv6 extension headers in
 psp_dev_rcv() decap
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, borisp@nvidia.com,
        saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com,
        mbloch@nvidia.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@kernel.org, pabeni@redhat.com, daniel.zahka@gmail.com,
        willemdebruijn.kernel@gmail.com, horms@kernel.org, shuah@kernel.org,
        cratiu@nvidia.com, raeds@nvidia.com, rrameshbabu@nvidia.com,
        linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, bjorn@kernel.org, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=I8/w19gg c=1 sm=1 tr=0 ts=6ae0e635 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=JnKecZnUtZousrUlYMGU:22
 a=GCtVsLiEsvdnKASXBLoA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3MSBTYWx0ZWRfX5jlq9Q0m2txV
 HF16pnyjL9xkk3prpQhr9lU1SlS+wi6HroNjlZyobny3oifLUOHw4qc57xEuQ0srYt0wgewrLVJ
 bY4sO895uZcFLLNt4QYRjAJ5Ls1C93E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3MSBTYWx0ZWRfX9bDAPFfhzdt6
 oUaiHL6MuNp99CDG6l8BriCpdDBjlPbaerhFegpUSz/+hLt6WkHL0OjWbdAgWDjLEs+gZe2JHA2
 q85GRe6T2H92TZeLIlWCxh/CU78bBKukg3XFufp4cKj20ATHE5AnbNVsGwggB6zfhIzuM40lzYz
 KeUejA+5oZTmWOfBXegIiQyJ3zysXlMUQQ9vyvQfA0sybIWLy+HXPXonub35QyCt3PezpYdWnau
 EZB6N5kxbPZiXknDC++OQsNPuX4RkpVfmg26zyKOT5VerR2k5C3XLBDiUw2Yjlx5MgWavKFdXiu
 PTAEtQazG4S711EypJLqNQ8H/XdDYn77EX9c09aMprQ2lT4RHBB6KuRObMxMJ99SFbWj8CSVBI5
 0iVVnAtVRyWyCv5gBD4RSQUy+PxLtp1dy0rgRUtKY/aJoyufYo0QDzHJTqqwKeTNOKzuNMVYyW7
 nTfMs9hR1RVZRCd2ThQ==
X-Proofpoint-GUID: F_SSc_R5XdICdRG7mq0SsgfKTJNEPqbZ
X-Proofpoint-ORIG-GUID: F_SSc_R5XdICdRG7mq0SsgfKTJNEPqbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_04,2026-10-21_02,2025-10-01_01

> BTW I haven't looked closely but is there no existing helper that
> would give you the ability to walk the extension headers?

The closest candidate I could find is ipv6_find_hdr() in net/ipv6/exthdrs_core.c

I don't think it quite works though, because it doesn't return the
location of the
l4 proto nexthdr (only its value). Also, we would still need to traverse the
headers separately in order to implement the reject cases.

There seem to be a quite a few "walk the extension headers" implementations
which seems somewhat justified because they have different stopping
criteria.

-Todd
