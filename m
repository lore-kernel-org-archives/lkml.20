Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044522;
	b=DW3z6lgsKO4jYnlbp+SRtAY1ACDueQD7TgOvvTGBSwgBkkUK3DZozGZ6vjcYdnMWbugc
	 Vp2tjP0fp4tEiMP/NR+D+LUiT7TllTvM8j0edSmg49sbjMekfpEaEp2sJk2zKx6BwP/54
	 zfCb35WmqzlIISqplr/QP1lRudMTS31ch1PEfEQT8uhFQ8rg7cp7T/lPrOXNZU9lhVGx7
	 1jiEJfZlCrxLJrjj3mLKNnsluons2ThVXNOSYLU/3RNi97Aaqv7mp1BJI+e/Shy+xA3gB
	 7fw5Kkz7rgmKbuvFsjmKdRKRhr9tlXwZODv+b1i4C2lj7LzNq+nwdnANtzJ4T0aN9sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
	b=z3g5WIppBKw58Vn8kS37p1mHYoTNMZmQwpymWLI/Ujm4Eu8nFAjrBwHKzLZjwSI1s/kZ
	 eUue5jDjjwIuY9DzHvLgzuW0WooadbxJaZJQajzQVeR2Ll4S0hE4Q8L2EbnToKvPQuRoG
	 xKMnADpfbeiQGl9j6aSEdtWcYdgk4UhQ+DuOubcyVvYU6PEtaUCI/SAZE8217h9b55pwk
	 y5VqapmkmKCm7igxkxX3EiEEvrvlQEb9AI0/ZKZgY5o9b3o9NaszLvTnhkX4NvE+odYIY
	 WZvAHRPLyLoYbg1UGzC0hKkNghJZaB/cOlXzFCYpLmpLkZ/tLhIf2Efu1J9WKzdII4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uL61zkhZ;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2699606A333
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 09:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2699606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uL61zkhZ
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2341174eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044521; x=1794649321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=uL61zkhZRsFHHsiDm5Ks9IqWBn6C2E2i8m/z5Ymh3Z0F0tvWtUGd2sgK1touStbTx7
         7ZYnNBhr2Ok6MPLtTpjLepfQvAY2/vt5oAyNzt7CGBVMIVu/3Qn9miBcrIo7TpiRLALe
         uu0Y0BWAA8UChcbO0SArCZVsq7+U6B7Au2AW9D4XNd6xgMW8UJwL+qNnYVN3uCK41OVA
         Q5BclcM2vPmDvNt20mwH+/Sm2VRdR2j3ug6WcgHnyg68pJauKTDtdil18QjUblS/+iLT
         Z6f6QO0SusKLn8wSBj/Gf64S2bk9VYAN501x7g1YYR9LAgcpv3UqjxFXiG9Yi17OlIDd
         rq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044521; x=1794649321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4A0utHeqTpPpsQPoK3Sd00TkXNSK6fwIX1scmyIZteA=;
        b=PO99UDSWe1QRpPMnHFJzYylWtslJxuhUdZUc+ySxh6VdsobGaRM7P0JiliqF5Nf0sN
         dA7sV303hb8ueqChCTQxrvLmr+DMkXEZJLc+QanwVLXI9AXTn2ubPoCG0tsDRdFv/PUR
         8CyAZdG35+rD1Hdto29Nsw/wK6xxN4HYhe6FyvlrcZEPYSaycsvNKc5lyiEpcY1EX+FQ
         9h3/o1qsab5OYraw/vHihsSb1HvT9++eCH9m+Kk5j5a2uGoBbgcyjBV8t+g8wRKLZxDD
         R40N09VNATXxvUMNTwa8Xmqe288qZ3TiDUOh3Gmw3R0JKxr4Ls+qjZdJ2tUmK2bbquLA
         +PdQ==
X-Forwarded-Encrypted: i=1; AL+hErENjmHnyBlCFbgV9lcbLFeJhw3dHCR73263bvDPEPxL8elm1QVg+7ASPAR8AMq/jhiSj7noFzOOFSHJARc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rCCO4qLigtreqPR42ivwH8CexHNf8li6fsqw8djdZGr9hxXTY
	jr7+khRbkDKpFnTYRhMD2LKpJtlmslKSHeI50yzx5tEi0P6WHfwuSP2t
X-Gm-Gg: AYBFou0kGapjDh1/DbQvvzcAXoKYsbGuUOduH9/xj7I/8Zf2n0V08+SICYJc5XfV5LH
	c2ssZ2qe/sOTc8W0l/kuEPs9rYp/xLcrC9gwxj0vb6onZOml55aAdw1bqHR8T1vU3eUC4gRX9dS
	9ABJ724fqFC2bGqlIEl6MWypmcS23dkU0I+Yze6LqCAy+XX4XjqeaokqkZn8E22tXb47H/D+vGn
	7AD/ktSNI30iXSFzSSNbpShi2SmBm7yI3yCmMyAV9JpjT8g8vQd4JxDa4MSW3OiS9n0Z6TURSr4
	rgPVRpY6ZpazBPL+CAokYJiqayWpVxf8MWbJJK0RMOTWO0zCU83KH+lwq1Uiyl1DlR3oTLoKUBD
	J7UHR2/xeUksT1r0yxS0of+urJJT4hcZYgKxPe2FA/UTcRfmwq6dT9Pc/S9j/JDmH7Tj8P1hqb/
	yEQGtkuSeFoxJFJw2tE9C9dDUia4uPY1zMm1uPc7o4aFsdoLpQb5o5vEbRyU89Ohbx8nfHLP0ei
	EAyfcTMcvnfvp4ZRd95RogTNgaPv5DYYH+Ritzsd4JOxdw3v6nIyKIiSvnd+XBUbnToTg7fg5XI
	LJaNibU+e4mLv7RzwSSychQ2qwue3NiMxscHcbXnLOrTpfd7qhPyQG+sjXy1+69foYzxBg4fLH6
	ywWOFGuH5SyvECHR4YBxXsQrcG5aOR6T8EAEJEE79pf7E78DoWSljeyiRrwZrzQ==
X-Received: by 2002:a05:7300:828b:b0:36f:5861:69a2 with SMTP id 5a478bee46e88-36f729cf8c1mr6557078eec.3.1794044520841;
        Sat, 07 Nov 2026 01:42:00 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8d44a5fsm13217351eec.7.2026.11.07.01.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 01:42:00 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] soundwire: bus: Hold bus_lock when looking up slave devices
Date: Sat,  7 Nov 2026 18:41:55 +0900
Message-ID: <20261107094155.3951878-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103095445.81414-2-lee@kernel.org>
References: <20261103095445.81414-1-lee@kernel.org> <20261103095445.81414-2-lee@kernel.org>
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

Tested on a Dell Latitude 9420 (Tiger Lake, sof_sdw) on top of
soundwire next at commit afd88e7ad781. The details are in my reply to
the cover letter.

Tested-by: HyeongJun An <sammiee5311@gmail.com>
