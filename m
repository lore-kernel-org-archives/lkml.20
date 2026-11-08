Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794148150;
	b=qy1xQ+eeoSP1Xk3zSxQGr/Va38oD7Cn8uRty+D+RZydaGjdekVlBr44I+HX5fkXRFKx7
	 CeGV+8KjfxAMKkr5uIKKd0WyiGDgIzVcEg/2Nou9I10yZWM07tp+g4XGyQP97tNqcmbxs
	 PQ/ZMGehm+QIazk8DojtOEb1A9tPzMURX+8uaTTX2hOeDi34oRfiFEHISbdOC1ZKJR7j4
	 kS5IQjoINMm39AZrYUcRW+3Kyd4La0Gejd3PTENLCe1ktDKcRe1jCwl7OCR2ecANTWobb
	 L6gqm2hHOChKVRQ9UFAYqTHsEf4kIrjygDNn8cboQ6IzQW92WHGokH2IgjVioWH+S1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794148150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=nsEN2ewwq/SO7JFjgqolGnWnhAJtT+s3jJv0A19D4kM=;
	b=0dSQhwFZKj+PrsPS6Ykfa4e5u9YyX1f45i2HUHPeOnPbC5ixQZDs8k++AUkUCi/nzfIZ
	 yc1cBotcjNZ+S+M/XSQbSayhITj+vil4m8kZpv5VKnfL6rlqBuRIDBPrr6YbjR1S3m5l5
	 qBYJ4w7l798c9RF0p8Z2krcSuysp0oYE0UhIjhwV5u8tM9TMQeiuzB7cKT/xasqWFS7HV
	 DHlfSpgEzBtqQvApU0wy5SOxUn8SaqZi07XU+4iF+WHN33k0ac1sfIKyX6Fub/K8wU+k6
	 Iz77MLDPr9/kDgRNtZ1vUKeLj/MUCvphrPGGWPZrlWimybfut6njaFK6ag3eQSO4CTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=VKdzGa8h;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B844606A331
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B844606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=VKdzGa8h
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5ec3561b07dso46700e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794148149; x=1794752949; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nsEN2ewwq/SO7JFjgqolGnWnhAJtT+s3jJv0A19D4kM=;
        b=VKdzGa8hJSVKQuHBop/JKxvSVhL95Fu5YtEcOyariJtZ6xuSznEOqXueHclAOYNWiO
         RnVdSCweiLDkhvB0VdRvusw8KHT6aIQsIY00y3kPLcrVUhg5J8w9u4sGiWnsRW/cDk30
         hWrq+IvNMAoT//ux36cNNlo0E1cCussP4f/ZzOtLTWNkeSjoqbeDiCsz6PBWVOeznmKs
         6tPxbxmhmeX8NKDQPgmO7UezeKo8cIGGFc5XPa3FrGASSn3lpG9lsJX8OXeIXHQHi06s
         Vq7uhgfo31OoSrIgRLeKzuaUl7bn2NTFIKRrTb7DXuadym10NnpURlOJbVGS5/1vxKWV
         TorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794148149; x=1794752949;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nsEN2ewwq/SO7JFjgqolGnWnhAJtT+s3jJv0A19D4kM=;
        b=NAcunyNaJWRWls04ouisvBF1maQVGWiW4MHGZ6fL7DI/HhvjLp6AR0D4bv5dW1jgSd
         H7BgSZ6tBWfoGIt4sK0pyEisL0Fz9vYLY76iIczF1EfBIy0sFyEUYsissnHOJhQQ4clL
         g5x5I1SKMHwKxbPvj1+5X9oaQzKP8JdHmKPfUwDryCb71Gu7uXED0BqFO+kn8gT64L/d
         gDX7NdEDs4PhoyYs012XNIFHk9m8Zd7cDmZ1dlN/1qi9EWYaI6KQSN/++iWMKXXgcLHC
         P4g2PIgXKaTAKVY5P7lEILhYjwJEq+JANgs6XNEV94hgrYngbca1BKPzvLic+dJcsCZl
         CqAw==
X-Forwarded-Encrypted: i=1; AL+hErFHhRRod8db5hkYbeUuU+ZwiZ6p+zh4AO9i9Zp8sXUNbCT0KQn2k9tINtWWskKNgvWfJDPUsZpgqdYlkgU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m4kPEDBPsNDkE1xMbJB5cSX9Qgukj3Jh/3LfG4ldEJBJlWMvE
	wmm6VseY2XmDMRWH+mYhRttOFCt+nlq9SEO/aSvHPIuWMkRANlR6gQivLdzfIX7SJy8=
X-Gm-Gg: AYBFou04qIKK/P8xm/bjx32T6nm76ma3CIPwRN9+5cziXpv8YHbwyVKSfcADtCJNHW5
	8HfyYwpD+BrysFJN3TVQ0Vj5MIlOEI9oSyR/yWkHmvNpa1G75Cc5sAreoTc62iphBK/Ijk33B/T
	4J6xVwcBFXWcsCp5BmN9RUhbYFwsREC8khaFe25wCiaHz5ekq3p/2ePgMXWwhD1LkeNVx6ssxUp
	0AtTzQKhBTLiwLRoGr117KpMpIvQKgtdBk8WY4fHwnCSNMrX5Hf/l9NmQPyaag9TpXduVDAIsid
	jPD3RPVJL0BL6276B93ZAmEOYK6K5+7m4sL3qPctRXqlKUMLv5zhFLpB+4rD79HMenFaK/HKOQL
	+pI05vZYsGakO88BiW0I0ITV1WxN00W2YzHnll0S2mU4YPeFu5YfDAJ0Ga7R5sn5lT0/S6Br9GP
	xRj+AVlTGCWVaTAgS+vr5ffL/vBguF9kqDhRAdzLsVWcfd+UpSeJiQkvLWcbsbQ6D7CtqLI1qnn
	lu4ICatV0HGhiWqM6qovkCpd//fJcgzAOh6q3bsYvTKJXXxiWLCJVoJa21TFNhGWtL8PTyPUFA6
	ZJAI8YgOEU6SsVuUVBVxpeOIfQYbfXK69AKzmdIOlDFb1i23Kn40Ly1G/qY5L8AYZ91+RnTthyK
	7qsVs1d6JYR5zg4jV1IWvI9/LlfGZW5MtQn/1vgKYp9R5Ni5w
X-Received: by 2002:a05:6122:e00a:10b0:5ea:bf30:851d with SMTP id 71dfb90a1353d-5ecd1fda430mr689131e0c.16.1794148148877;
        Sun, 08 Nov 2026 06:29:08 -0800 (PST)
Received: from soleen.c.googlers.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ece6418de3sm1961786e0c.13.2026.11.08.06.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:29:08 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] kho: Don't release incoming bootmem areas when
 kho_init() fails
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chris Down <chris@chrisdown.name>
Cc: rppt@kernel.org, pasha.tatashin@soleen.com, pratyush@kernel.org, 
 graf@amazon.com, kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com
In-Reply-To: <au_vQhHAcJbkryXN@chrisdown.name>
References: <au_vQhHAcJbkryXN@chrisdown.name>
Date: Sun, 08 Nov 2026 09:29:04 -0500
Message-Id: <179414814499.358073.17024430367999674004.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=531;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=pKVjfmlu0iTkn3Mne7zQTiboAlXNWpArbsEY/CDfG+0=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq8IczShqWPTsPqxG2k3B2z7SD/Zt27GlTcRXCS
 al4yUzZYCmJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavCHMwAKCRC7dyhM23N6
 3rxgD/9MCj+nbRihezlRzunNe1wcq2hnBD3k0gmKVmGDeS3zwRvPDyi5f8qbhin54yxiC6zIGKS
 Yn2jL0+MWh3D673KAwTIKuLgSkLRa31KeqkgDY2NIUeUn8n1dy93a3R6SacrpULUNSSqQBOq/dy
 /MZNEyK82xSwsl+Sx/Hje/21XHQyJPsyH3sCLOoTpyN387Iob3sGAwvPfDCeyFdHkqYceUhuch0
 bVhl0fHheQIkA36lWuVETbYeXTbgULYcBy33lRmBEeXn4u1NFBXg3A4w3PPodi4WkP+kKCD+4k5
 ZhRLfJUfdpzs4vr1D8w6sACIbQtKUKocah2JuyI6+ovgxsIoqDKFrqH8oJVhAuuFSGLvYQ2wPsA
 OEU/OWtcEFLUvTn0Dw997Hdp5qpkq2ai2GgWLBicMwMDvSjNA6uGaOSfBTtyYsxNUn5LFK66m6z
 q6zKYQ4nFeit2N7SB12qa2j0n8ZK8c3LdNBHVNLh34aTCT2hEPO5W0YAYztVYpgdTBMlwTZLcaE
 QGfb5dHSyxjwyB4SKOLGd7zxItpAUtrJ3Jtmo84WFI+WJg1jYppRzuGJye0uO2/HM4o/8lYJkX4
 YiEO/nkmS4FHId5uUw6VSGMYxSw5N9dAPVcFqHmFIw4V3Mj/3VCQp10bH6t1qgUNmxYq1F3Yeny
 y962hGozq0S6EJw==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Sat, 07 Nov 2026 19:40:50 -0800, Chris Down <chris@chrisdown.name> wrote:
> kho_populate() adds the incoming bootmem areas without reserving
> them. memblock_free_all() then hands the remainder to the buddy
> allocator.
> 
> Unfortunately however, if kho_init() fails, err_free_bootmem
> currently frees every area with free_reserved_area(). This can free
> pages still backing early allocations or free buddy pages a second
> time.
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

