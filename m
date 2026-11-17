Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884916;
	b=cqd/yf45D3tcsRTUWYFsrJF8TZOATD7XMIdfwj5TRA68akWDfiHmtotKVLbWKDA6mXXg
	 sj2H4vdUiBolHms/OfjjMZus1PIBviKlZZC7zNpK6QJTf7CnERzuOO9z1BUG8pMaZK5Aa
	 3ZChSlzY9/f27FHyORtm/XaNcQ8MvyvSNyJFrFRcx4Hnyv+a2HpU+Nv65lfFzeOApH+FZ
	 vaIiVkjx3MrGOzkM3EhfWQdYvTqINj1kBqmzhbhCAKknTDugcaAEb/R4tOqIL9PHBu+8i
	 eYKfadbPeEJITU1xbBXWG74UVx5+Cd0sOSIMhYKf+wF72nCogMAUpc+FYNFxCCsyeZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=w+Y3p4UcYcjN90HcYXfFfPpl0FynM3uDCS4/JoEqrWk=;
	b=A2f5IoKl7eL8ttPZxsFi6hKBXd2JOpcW0ztVvqXAsEcbO/6hpHiNQ1c8yL77RpUx6AWQ
	 7k9Fb4ntxS5b7zRVaUlpR3kM3PxgwQB6dHBIxqs55ijh2v+q68s61huKoJbDCeJsY0F0q
	 33aJlqeNDAGXgUHGI7QaUZlqaFz06YSNn1pGmKBdxiNiNYE/rH9yZ2BegHYvK8W3gqVeW
	 gzx5Ya+zGxDl/HBagtf52lpnJzPnsjz3pI9eWiX5CicBXc6/rKDQHjgJO+WHvZ3RpYNzZ
	 LLdTLHZgGhGRUPieACRM6PX3GM6cFq38p9335c0KBJTMzD1C73zGRyabx8fhXr8J8IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBkv9UQO;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620BC606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:08:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 620BC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VBkv9UQO
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9495f083657so400595985a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884915; x=1795489715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w+Y3p4UcYcjN90HcYXfFfPpl0FynM3uDCS4/JoEqrWk=;
        b=VBkv9UQOOPEmqtLq2jGc1a9+225+MsIBCZBLqH3Tc7s9QB0MBXyOp3M/H8VNA4o1A0
         CLDcAfHKCej8L81PwawUkfoaPTILZZeH57wo2RmqGs4mu5NmrRLaQElQAww3dqCfh6MR
         qykJ6abRYcl67Nv5XKY2o9EHkZBli0VTgEu0N3iUio0rXoPEZGtZ0SHJQUEIc24QKi7V
         jYLOgUFpGKGZCNgYeXrStIwnhV9tFtAKGVSJz6/zHPTBXGYE7X6mSQcMWLs98xVI1FQn
         qLcN68G1XA5PswLF62/o9SbRCkR+iw4tHcqS82QC9pxY+oQ3OO6miorvL7CkXd/UAHwt
         8ywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884915; x=1795489715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+Y3p4UcYcjN90HcYXfFfPpl0FynM3uDCS4/JoEqrWk=;
        b=Hvl216qepDLtLqPl/Qxaf8jCgqYAga7ZjDRzKbGUBIVFDLu8Hpor7xP87jekE67dDz
         GArrdN4V9E8sN0HM4cIfsXQzjwXQxoPKspZNJhUuXf/D1bEEFvm0MVN3FyWOsWco6eHG
         9Xr/qp19ZhA+zy3/Cbe7W7FfPKwmSYe0D8v2i4l8bzfedclkhC334s3a8AsroPYV12K5
         m/25bbqbi10S/IK7/U8CrfIqQXEvwQWSYiqjAGQbtZtj3FLjmynUQS2LKM4VqdhJzazx
         3nlqoi8ulPlTB9lVUkz3xgCxyuUQXLYnqsM0bRE/3//zO9DAlSUOTzA2Cn4Qrd65PBxz
         Y+Gg==
X-Forwarded-Encrypted: i=1; AL+hErH+WrsLNmlORY4Lpq8DwUS5jx2KGt8Bt3oSOC08w3qbqTWqEXrWWecpTOi6kNd9a0NQOEP3rgBJ57i6OME=@vger.kernel.org
X-Gm-Message-State: APuU4Z96uofOXsGGViF+/LD+wBF0t40YcEnkvhsMuU2dDRqnpu2hGqx+
	6w57CBKAsKoMMW46iDauVTmlxsDJddU35/oN7VUoACBOl8rvsi5RH8CQ
X-Gm-Gg: AYBFou27tNq4w9zE//2ssttaU5KFvPErzLJjB+X0oL3xjqPpat+gY2CPEsK64VwuJZq
	gbehmD5FUpLNWry1bP8iPACSgZXIJ5yiSfVBCzxQyxYP3RA7s8z3IBpwGFggyg19OGinOd+pYe/
	XNn4AkFXqLZp6A6hbESDkNzWbNSHVGplf+pEUzUrGFT1s1RQ05MXlpcGNuyv3mEr246M7PlKJLo
	5zyegC53z8VYMMu+oKVxSCAZQBiH9AtNvmVIdgy+vddgQkd9ddoR7F+GVIr9CAZZaUXNkrweCPO
	T9hqW9ZzFr5s0B9La6Ik+rHMBbI5dxnvVkrAb4rtOxLzg9W2EdFH+WRVi1ui74qLjo0n9k1ZcQ7
	kHBCbGRBxUjtDwJ4OzzFNyE4i52k8JMp3ihAlCuWjG5uP/J/6aVWAHENt0FhY+7eJwid93dAePD
	Do3deDCBQA4z5Cgc8VdsO684t8XF0QIzMRjVEjD5HhQE80MufZr/G2HVV5JipTH/MjQ9YRoQLX1
	lAzj7Bli8/eNuEf17p0Hs8GulqAe23PlQNbutasCe85M+ApTYCXT56NlzlZy3+tWXU10YBV0iEj
	WhkMLI14U75Y9N/8ZHGBm0mJRo6/91P8EhVGgSSyc9qD9fDdNkHpQrOxW2IDviFtv3w/k0vZgR7
	GAzj30VocOZFeax5p2/efUK/AQ4Zf+7CejPM8HCV9pK1PuX8/sQgT
X-Received: by 2002:a05:620a:2a10:b0:93f:2eaf:64d6 with SMTP id af79cd13be357-9494bb90266mr2006054585a.48.1794884915318;
        Mon, 16 Nov 2026 19:08:35 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803fb4sm981181585a.9.2026.11.16.19.08.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 19:08:34 -0800 (PST)
Message-ID: <93f7aabc-4a92-4d3c-a6af-a84b461c0e0c@gmail.com>
Date: Mon, 16 Nov 2026 22:08:34 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2] bus: mhi: host: pci_generic: Add MBIM-mode config
 for generic SDX65
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, daleyo@gmail.com,
 Johan Hovold <johan@kernel.org>
References: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
 <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/13/26 1:53 PM, Jeff Hugo wrote:
> On 11/10/2026 6:06 PM, Haipeng Lin via B4 Relay wrote:
>> From: Haipeng Lin <jimmie.lin@gmail.com>
[...]>> Boards with a Qualcomm-ID modem in MBIM mode have so far been told
>> apart by subsystem ID, like the SC8280XP CRD's SDX55 (17cb:010c).
>> This modem carries the generic subsystem ID, so select an MBIM
>> configuration by machine compatible instead.
> I'd like it if we could query the hardware to determine if it is in this mode as maybe one of these systems has a SDX65 dongle attached where this workaround does not apply.  However, I am failing to identify such a mechanism so what you have proposed seem to be the best solution so far.
> 
> Unless someone identifies a better idea, this seems reasonable given the situation.
> 
> -Jeff

Hi Jeff,

Thank you for your reply. I tried to look for a hardware hint since we
have to select the channel layout before opening a channel (so that
can't be the way to select MBIM, I think). The oem_pk_hash on this SP11
SDX65 is non-zero (12 words) so it could potentially tell this module
apart from a dongle, but using it would mean reading BHI before the
controller is registered plus adding a table of hashes in the driver.

I can try the hash route if preferred. The machine match is simpler
although it wouldn't cover the situation e.g., a SDX65 dongle is attach-
ed via PCIe tunneling/USB4 you mentioned...

Best,
Haipeng

