Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261B42D94B5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791779869; cv=none; b=tXtWAlkrBBiQLJdjLDp9MtyquepgIc3Ag0uFHyvRvDVVbX9Zrhsu/LyBJilpEg2ljYI+GCNJw8KH0OxfX04oYcYP47b5LWYAUrQryhl8+/2i1FYe0wCAvFN7xk0Vp9kfu4tjcbJrYO5XXtr1H0tYAT/bs7nuG0GNhV0GeE2dBUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791779869; c=relaxed/simple;
	bh=9L3tqcVuwWT1lsikokZ8qkn9K8zI6RiafRhNL20/m3g=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=P8zNTz8Mt3ufPCSpWaJk2B9aFgPjV0Q4J/KbsC0alYFESh2BqWLIf+OCvL5dBdN5ydlwftvK6gGbCiF+955O583QdPmZ0fSN7rACf4ej6ReJCaZzGSmeiHtIvqasT+DOPJVOyXnOaR+nPUzgc82vMIfw8pFbSScufcn9T/Nt04o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBOWAIhN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBOWAIhN"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-88aea027391so629495b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 21:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791779867; x=1792384667; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9L3tqcVuwWT1lsikokZ8qkn9K8zI6RiafRhNL20/m3g=;
        b=cBOWAIhNKKr0horrqDLF0oKX0DV/YZBB6l2A5kd543PLVYabo406OV+3X61XPZGii0
         /VGhn6wgoIgCNMfNBu2Ohclx7AWVh73yIsxHBApXVKAp7vVSrHmu9JCPnvVDRshIXzht
         7qd1bg19lPI/Bl74ryDn59jT1e5IarUgEb+QC/2RwreB9J95ubAubKddGJzq0l/z8/70
         9hJefnubUZK9lMLOE5vwZoK1yks05NF0eSyzrVVhlhjg1g+j76k/+KONtwje4+Qal2L1
         Ud8n8PohZ2kI4n4LeKPtKethXkkhdapDwcMiLRfzy/Zf5Uzkj/2+sI1DXpMivCpgx+za
         eI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791779867; x=1792384667;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9L3tqcVuwWT1lsikokZ8qkn9K8zI6RiafRhNL20/m3g=;
        b=Fw4IuB139dHpcJZlzzqLl5QWd40QONkHk5m1sa/ByQKjYZ/pc307Csr+Nd/IeV3RHK
         7N4gOgqFCBLf/mt5FCPc+VsP3kGusAtPW/uAzS4+mBTdcdbh245BPIpaJ8g3JfcSiYNY
         y2TbwZch7wzZ5G0cekUiTdmcJmkXmvrqU+WN7nYN9q75iD/pujx+nqhJYyAIaq+K6tT4
         0VXtE2Ckm7PYJzFPA/9apP4y6qSpUlrl0osBq0TIGRVk0zhJ6Dlv8Cq0j1GbPhQ96eST
         nqvrYsjzjQEfWRYb1apvcdsjDHRGMoe0gv0vMkWajCLD/OimCDsQfvG7LJKCtqV+0XpG
         qklQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3mghUxMtltWNqua2UdYxkBPfJjKiok3b6GuoG5WIrTCObJ0UisjyIoveY1sRlXwYfqLLyuTW0jXTBebw=@vger.kernel.org
X-Gm-Message-State: AFq9FYISbFvHn0XY/Wr3XhRgdR5M1A+Cm7Isu8SN41QJHw/3l/lzcsZG
	m2B4oftJSQ6x8mJoKnugTnk3uoPOPoDmh9e7mOhd6hVWK+73vhfhhZ9NifuDmQ==
X-Gm-Gg: AYBFou0ihetmGO/76Kclkfe6rRemC1ZYjvwa7zdgeIb21Xe8C7MtnWr1g8oLgQs9g3h
	mDXxRj47q3buVcQZxnKcUSWdlnAPhXm600aVNZ8CRJ8Ly3GfukOGbpXqzwVUA4/lYmZ/2G3PfcL
	X9ZH7Cm9zDna2dT7R52s+YrLT+cvK9Zpt4Q26P7P8rJv454VK26Ce06dZmrj/d0SUbpa+AXAFVe
	aJuZN8RQ0KC5i7kpAA8ywBiODTRG1AYrBOw5wbNt5d5G+T0Rh207ITpb3D84DXRpS9L5J8tyXET
	0cIJzL7ZbayBuTAKEGMb2aNSbQ1RaFIbhKXygvTHTwzYw3YcV+QUxpWdHYVXDzCV2bzjs/0sm9d
	L+31+G5NR2/60qXksHhsxtxFQQd1vlBy7SGO7WPDs/LiLevdDxgU/m7qtjEw2an/x642LsoE2Xi
	s7Hc/twZEPwkl0LzAS92sMm9Q0TDkYIoXWokOu9mCT9Zj7Mom692kBSmRr8VbRNsg1pyIvaPg=
X-Received: by 2002:a05:6a21:4598:b0:3dd:a195:fa1d with SMTP id adf61e73a8af0-3e16bf3fbbemr6620405637.66.1791779867370;
        Sun, 11 Oct 2026 21:37:47 -0700 (PDT)
Received: from [127.0.0.1] ([116.98.134.138])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da05caaesm3704308a12.32.2026.10.11.21.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:37:46 -0700 (PDT)
Message-ID: <6acc641a.d3162159.e3fd8.3a5c@mx.google.com>
Date: Sun, 11 Oct 2026 21:37:46 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Bui Viet Dung <dungvn2345@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: stephen@networkplumber.org, jhs@mojatatu.com, jiri@resnulli.us, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] net/sched: sch_netem: prevent packet length underflow with negative overhead
In-Reply-To: <179177924024.434549.1159457377130534867@kernel.org>
References: <20261008035656.330667-1-dungvn2345@gmail.com> <179177924024.434549.1159457377130534867@kernel.org>

SGksCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuIFRoZSBwb2ludHMgYXJlIHZhbGlkLiBJIHdpbGwg
Zml4IHRoZSBzMzIgY2FzdGluZwppc3N1ZSwgdXNlIG11bF91NjRfdTY0X2Rpdl91NjQoKSB0byBw
cmV2ZW50IHU2NCBtdWx0aXBsaWNhdGlvbiBvdmVyZmxvdywKYW5kIHJlZmluZSB0aGUgY29tbWl0
IGRlc2NyaXB0aW9uIGluIHYyLgoKcHctYm90OiBjcgo=
