Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187110;
	b=nJ0DQ9jEpz4MXkCtEesjcwh7lgSKZTWEAKFIWt1dZO2KsVNBrpGkuifZHZBkHSoWHCAh
	 0V4H0VsCv7VXSE370MUGTWgbYrbT8L92BxsKtIb+aqzjMYqkX8/sNLGtohAU/6Znq5mBz
	 M+qvaESz8GsktJ7vnGfveq9OeTsAnQwNBcaWrYJdBEkfvdpaNK3WhQgCi7Vrl7HKH02iI
	 jyF9jZriSWw7spbFPKFN2wyEjm/c5OC71SoiBSlxqUJzk4SxB9HbgF+Tg5qjWmO2CCLj+
	 Fd4jwpWcNssiY8dBmWn9676L/kAu7dtNxFFIUIH7odq2JwWV2yekZ7DbY6so/whC9AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=W2giDCY2xuWpTcZAEXRUmytbytl04hUv3N8ovPS9868=;
	b=XboCMCG5zr7U9gBAezE68Yph1ldAvQdBEN9J3eihi0cA76yOeq4AX7Bv3UALkx0T5USI
	 aljHFVOrmbhytDnTLbgND4mZOVX2CXl5w1fEmIyyXBgsZcPuJ4F1TyAzVsf3aUTKhKyCk
	 M0pu8U5rjdMutIO6iMriN1cC/kiwmdWLLAEdhum59x+V5zf5hKrwlP0RsokRKEEPqhgFf
	 mCvWc7Lpwkpge62BHv4MUM5TGZ6EdP7ZkBLq1JsTxtQG+9I0SlmONxTAxT8D8naY72VDd
	 a+YXdzsSARvWBxISk0PRMq/f+g6c6sjQcBoU/96WHWtpQPaLwNy1OYcrm8nfQvGVyog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOugLRcM;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C77606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81C77606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DOugLRcM
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-313bab9cfe7so165057eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 04:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793187110; x=1793791910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2giDCY2xuWpTcZAEXRUmytbytl04hUv3N8ovPS9868=;
        b=DOugLRcM0EyM7nC4PyJDIYRXIiT3pKHDFKlTsfjqo1BYSjhs5Xc0GMR7XvUvKFllww
         ZUGzy9NESCcXZQ2FdpXdRJIVRD3rl+SzTyVY5uDSe4B6N54KZoQ0Rh0KSuEDvEUoQx20
         sNRuepdAiUASIgvRJyZQLz3euL6Z5FVfqbV+NXNbk/oTK39temn0NG0MqN/oFec4+Wju
         0NpqBMGJy4IyfG1mZLQD9F/zqBxPaMctbvmTbZWrHrb+thcpWxzx2PA05D3WOicrQM+S
         aoyKPcRvqIiwjzCnvoyWbv02wqGN7XqpcFwxwZNEBXVnAMBOTFtMdJ+8rxMJwIaFfGor
         qywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187110; x=1793791910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2giDCY2xuWpTcZAEXRUmytbytl04hUv3N8ovPS9868=;
        b=Z6tLz72XOWOC7wFXPsoNf8nD0hhy+OZjeMhJVm3/8A0Oyz8x+R0BjKXTCFTMY9jXeF
         LCWVWt9Jv6G4X/OmyHrUnjmnbM0rDUuiHpZhJ4gDnML2bcSJOtPL6YeyGSfXSOxCk5HN
         CoSROTARrsrZ2L3RqZj4aX+Hw/KejUVPqo399DSYUEMZAnK5hN094xRfx8jzYsDRSeS4
         l4aZnpldgJzehMGeN3fG0sDTRlJKrc3KzIod7X+/HtuO7gaCs+wbySKxZ/kc+nPT2eip
         TQtpwCuhfACpmY4LyTU3TcCH+aU6TMrWSPm0uVimXd3lK6ESmD7IxGNdjvxrp4iYcXsH
         TPjw==
X-Forwarded-Encrypted: i=1; AKwUvBzX241tFf7tJ0aPyhjOLJXEyDxeCxNpnlAvsb0nOi+nA3H6w+BfGaYoJqhraXgrHQVnK1ZZuKUV2BpAWkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwc0LLxRvVwEMCMoMxos8bKBES3livYspswvAiuw3r97vGInUv
	GSvZzr0j0ksbYC3wzQeIlEui2wgtIiGuYgNMR7X5lc5Hyc0rlayranda
X-Gm-Gg: AYBFou0t6KwjutrHzcvp1ANOtvgd3/4OV9KocNBrmOAOhUfzwP5eAjhcQvp8hHmBIf/
	kuVjc9L0jfx/ZxTP0CPlOeecEByv+3zjLdMc/ucy3Svm0wz1u3rhjsEjMTT6TLee26xjkL87ajY
	GMBIKzSp4SbLocgH6g4SR8tZwiziVTrPeoOBnTw0bejLCqxxMGdCGK9haIF6kXtEK8tyemBb6I2
	fiskhv0vS4vpH+H6tQJuW3eNFM1oJ9iwnuv4IdOAZBgg0LFupi4o57RmTh+BBByiEYdEzrOlvdT
	Y58JRw4/vHfap0QuC2JXYEPC2PZdgDSVVcq9L032KWBMXXXELdHjNAW4szYf0v2qxQuRAFV3qVq
	Q+HYbjBUCGtGenqmj6OYNrWQKILvaVWybkDCQUpGR8ugv9/z3iQs8QbV2b1WkIcEHKeJBm+gNQ5
	E6de0J8f+ZzASclWOrrF4JMBmKsJpQ8ng0Zp+Q23SW067u+qO2D5niOQ1RcyJCqpUV3Doft1X/u
	EvJ7QvBDm8wpq/KQLRXZC3VYaD2cirpQREdJFNkZb6u+Tkbkx6+yNHrSb8mknW9CI2k06MYCTVD
	kmpaz1U8DxkzCnTtekD/ipJ9Jq+BhQzOZKoa8Z6QqR0UA1/OgmZW7WSUurF8HNJ/SynESAnvS5H
	ROQ==
X-Received: by 2002:a05:7300:4306:b0:35e:d21c:f33e with SMTP id 5a478bee46e88-36a1ff99b86mr6523145eec.1.1793187109429;
        Wed, 28 Oct 2026 04:31:49 -0700 (PDT)
Received: from tacolabs ([72.251.220.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2390929asm7462425eec.12.2026.10.28.04.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:31:48 -0700 (PDT)
From: Reid Downing <skibletz@gmail.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Carlos Maiolino <cem@kernel.org>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Darrick J . Wong" <djwong@kernel.org>,
	Eric Sandeen <sandeen@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	Reid Downing <skibletz@gmail.com>
Subject: Re: [PATCH v2] xfs: fix wrong compat fields in xfs_ioctl32_bstat_copyin()
Date: Wed, 28 Oct 2026 07:31:27 -0400
Message-ID: <20261028113127.3374246-1-skibletz@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027161748.2760321-1-skibletz@gmail.com>
References: <20261027161748.2760321-1-skibletz@gmail.com>
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

Hi David, Eric, Carlos,

Thank you all for the careful review, and Eric, thanks for catching
the second line.

I looked at the refactor David suggested and Eric sketched, and I
agree it is the better way to write this function. I'm not confident
enough in the 32-bit compat code to send it myself, and I only want to
send changes I can fully vouch for. If the refactor should go in, I'd
be glad to see it done.

Reid
