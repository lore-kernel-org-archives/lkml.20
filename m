Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514336;
	b=k1MBx7w126aj13cgoZ0g6JHl9IdvMEu9Sac7gwemLicTl+3mlwB4Hy/J5l5hygUJPlmD
	 dJFZ6tkvwM4zBJGVQTbi5bwcbrcCEoS33gIpv5geB8/Zfio75SA3fl876BmYqurJHALsB
	 BRKN7G3fyjGmueesH8TF+OgUpU+w8LOZ13RdB9tDEd9UP4hiAcyMvpInikWt8lBUtOUj7
	 FgNF5Jv8kHFLtOUudQ3+LHx5L5E2jBM4zHdOmf7Jz8pE3fo5oAYFTD2jlkfGtN/kQPqDQ
	 IJM0qPg0nm1Ht0DpjmUg6AGelyJFzaEX1Y7fO77Od4s4I5+wmatMEnOfBydcrzYHdMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=enhyFaTlmSe8qk8N5fvqsVTmYc4LqDIJpmhNr1L+Z9o=;
	b=DyadpI3Cx0/U8cYgzsvOQUvv6tCLPSaY/o5glU/eRDn7e2L0k5i6yFVLioGFq/P4V7np
	 hukKGaO7BNPXKgfJca3nvfqKxpx8Tg7qa0TefMr7EzMXLH/cAQuEZbVo8wNOLA85ofAQH
	 000+qib5ORQV/3E1a7nQrsy7Y+AqLF01mfzfarDrx2u5H/D/VWbZ+p5O2TgFnSdRBQBI5
	 S+i0Ag7e2Crip4XX3FygzO92irKCJOs+t5yM8TRbeKaG0a/CkbmpXhDQqaXvWFcsnYUi8
	 9qs2p3HnodMkkKV7DRCP/+vcpCyn4ZhlgX0h2qjg6Dq7Ldw9KBkRiPNf+Dj9ZuSMQbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COQMd70Z;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B2B606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B2B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COQMd70Z
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a8cc11ac42so153618c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794514335; x=1795119135; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=enhyFaTlmSe8qk8N5fvqsVTmYc4LqDIJpmhNr1L+Z9o=;
        b=COQMd70Z413zqJ2b83x0DveGH91bv22XH6Fu5Dh63m8XVUoTwCuc5f9GtEnVzY+Bkd
         yJf/TdgURq9P7AeNueC4IPw6YG+Sja1eGXQOZjEsW+kTQDMf+09aw/UCMNIV8SBLIrkc
         G+pq0dssMQUu1Ft7e1uefalVUKBIN3N8abtazJY90TRuUtWk0lKH6UFyDEGAcsrVBxd8
         Pu7ZlpM6GNbVQmZgPZu40vf4795fG446BJ57Ic2YuFq5QDRXnzEEZdUTWTJhik0n3/52
         iygA3IjK3CHG4/+BQpyVkxvmqeQ8p+vjpir+UsOOOZEieT45XErNImj71yXK0/i4TzJ7
         GkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794514335; x=1795119135;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=enhyFaTlmSe8qk8N5fvqsVTmYc4LqDIJpmhNr1L+Z9o=;
        b=RuU4tn8OoKY68sUjWZ8btroCOHKB+29vuJdtCpIPdbWhypAq0qAUOrI5dXGWQmgFFU
         Q+pG35J/tV0xLBjf/A56fx8aQNqGIJSuSrIeaTVbw7ahyJb8jNH3WlmKDFpveRRnW8Yu
         eno9CmtItTXRA7Loas8fF7o6LtuQYUltMvZcPMVgpA6l7yhqOWRC3l0cdHaVVvXPdBey
         LoCrEUVJF9Ix0+3jJCFXbv5tPz5ZeLXH6CVV1otQ8bvHfe3ACOdBcvXmFMNc06EVDpjw
         coKgDFJb7h1Hc9PdZ7xKWPpJ0hGSQgvMMTpij9zAASHaRADhQwKiUpESaaXlwBR+70N1
         P2gQ==
X-Forwarded-Encrypted: i=1; AL+hErHX+ekkgNpEZcrwOTYT6wI2CLN8ZdmV+DrJjhzdUXTPCmCS4dWyTSh5a8F5KLtXHUqtBp/vXIYkjQu94C0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EBoTUlWrDVq5TrNJuldtbe0dCQ7GuCVF8NklRnHis0vpBxXKH
	IKXAwApRxS+OHAk9wZjg48OT4IkNjUDmHkCNiuljr9Mf2/lh2o82269e
X-Gm-Gg: AYBFou2NnJsG9hU340Kj+Fz6+TYVWVx+ULOy1tm14jo8DAQXW2UR+nSTWrDPNlVx8E5
	TAsYzS9k5HHmNuYPNTJF/n+xy24P6UBgB/CobzD+EAro+1dyDSYKLTBSoZ0tja0zjjkTy4dovQ8
	TvnPVKDmJdZzPB0CX36Yu8+5uxscxl7TB31m5zEdlQ/gP/SiPh9y5kHJZTvrHJs2iVx/DJwBrce
	OueearGXjr+VzUg/SkeEp0/XNdnnMOzP6h41mY8rVfpqwyKES3smdAPCI+PvEW3e+3F98ijnA3L
	QBkDlDCo6y1iNSJ8vLQ1PZvELggi6ukCwcEthuwqnUMsrR7TbI7ggpCn4H0d33GRHO3qhj3o77C
	T0GW6DNpOVL6wEGoCXS4SyywAlFWF3dTKR6UitswdlQ7A/GRRBSgThbdm2CTQ7exPlTTeJPBYeq
	PB3QhrCJDQzprpNONjssUk1dePdORFbNL1c5VA6V7JbBEI5rdL7/F79Tn1AtVww1KRLJpPy8XP9
	PwtIi8dQe7+mKkN8SuncIcRlun/kU6OUEHDPOYY9/UYfS7d651zD4VP83fvustJy/Eg2qKJrfj4
	+wkH8gO2SZFCl+7Hg10I1ZpJsKlvBhSfnN1cYfeREBMoIW563B/3AXI6G8NtVSNjVAaOPR9eBJu
	Myxtj5KWWowDV3mphfxvdJN+b9tAflb/ZaI5KT7u/fN/arz8DOwzJJxBUYFmxPaeW2S+kTFLsjV
	8CpzNGd0liSjKkH/7ao6mWapqONo+Li2gfnSCoburRkg==
X-Received: by 2002:a05:7022:299:20b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b503150119mr501572c88.39.1794514335221;
        Thu, 12 Nov 2026 12:12:15 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm1908017c88.3.2026.11.12.12.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:12:14 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: accel: mc3230: Leave chip in standby on mount matrix probe failure
Date: Fri, 13 Nov 2026 01:42:08 +0530
Message-ID: <20261112201208.476450-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110070206.1452-1-laixiangwu@cmss.chinamobile.com>
References: <20261110070206.1452-1-laixiangwu@cmss.chinamobile.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Nov 10, 2026 at 03:02:06PM +0800, Xiangwu Lai wrote:
> The mount matrix is read from firmware only and does not need the
> chip at all, so move it before the WAKE transition.  That way the
> chip is only woken up once the remaining steps cannot fail anymore.

Reviewed-by: Arnav Kapoor <kapoorarnav43@gmail.com>
