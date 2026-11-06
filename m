Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964886;
	b=0XQdN23fu47NkzYJDr5KITylnewN2Yo+wkMpaqz85IkWelnPaRzoSy4dkLHqWX5bApE8
	 AC0SRNjUtbshYhKCy2XK6qpfxC7HVHfF0AsMrj+e5Z6T3ZgUJaJeXYUhMX+bcMIoVWTwk
	 hTuEmv5qhKlw/dMU/LVkldDfE1KxKNgqjuCS0XX4mK5IVLQdp799My033bKI9Yoc+q2w0
	 Q5g9wUzgus7E3flNKmlUGKu1xWveWUZtVcpwoq4TPxWWC1XmZkAK1cqhyt0DEXdqh/oEg
	 VWF+R0ZBBXWJ6VVy2lh43q4Rl4zksmEz0M0YM/kJfG4m8nFFVywZMmjOcv9Hphi7NIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=;
	b=OSqgYmwsCENcFGv4ebd0iMXX/Z20HptDmtyzWpYNkqLTlZ4QEmDrf8+Joy9FWaPcjWU6
	 AIgiM0VL3j68jWMRrkWptWHouP7Qwk0ArsNAB2zTkl5UMqsB+Of5IE38foo6PgRihmZCR
	 37R9ugs/ZhYx9kaq7CiKbfMjRLoABPdRgEDmAwXI1G26wpa3AJe9hWPaY1xy6htnyPuIG
	 V7XMVrKDM5yy8DWf1kGWlrcgTplHrdMqyLjrcYevvUIApUPVk5BJyOXoOkjOOyyeY/SDo
	 ddclt1+5DKndSHwdY7ijQQYp2qmcRF+si6HhqsxmrLsOpyiU8R1RWc2mzZiow2msu0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClVoZFyJ;
	arc=none smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3BD606D80B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F3BD606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClVoZFyJ
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67bef25eb92so640469d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964885; x=1794569685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=;
        b=ClVoZFyJkEEyDgJ0fXi7OPN1vdSQqxVaH8KXbNFLWxj03aSLR4Q+UkJc9yGVrBUpBU
         +AydFHydDgizfQOMY2dU0dOkgQe07rS0OPzCvoOYXnahamQqawdMb64hKv56nmY5WHkH
         xuu4Mpcyl7EpJpn2dEx5uuFbyWZ1LlsLUFSs06pbZCOy4cBEyeeDMI5+6W7/eQDGPs67
         LA0cHYZ9/sQQ6fQL7cFE/BLbZP+HcqTKwe4G34Xjy4S8pAP4tGvj6+R7NFW13vgmZ8gO
         klhtJ589ya4sll4IO9U+T6BG/6GxjyERd9MhlB9jMtllbTxtUSrP28qfyJK9FHJWocj5
         47qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964885; x=1794569685;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gt1KO4qbrQ9HgN6E5uSpDhwtoQIKzsHpLRksFqC1ApY=;
        b=E6mfYnsaQitc5fuzrCR/5MsUcJJQEyZ21JeJySGmZBJlKIjVkocx1y4ZhWxnc69Zip
         hmDIg5rsXYh7Z72FlSd5YIe7tUJAYZAMFJCFwaTFq4Fo+sLyeqcTaIwcZuXi/CcbNH21
         6gqkxCDdAiSFXh7y/pz4oc9CFkydM+vzfg/0eDpaDs6wqmLTjvNl2dJfIWcKB212uSNY
         n0XgTbsOaILnX4+RrfJLRJGuudrx+d/fay49IfnSUrD0DZDTlHxXzfdxR8NEVlAq3ZAw
         SBoD1LdP6Ux/Ee9TMdfqWUHu6acIZkCPGgssyQyxKrZaxMvAsK/lblOCVc2MoU+K71ao
         2dqw==
X-Forwarded-Encrypted: i=1; AL+hErF3eZWcEv8OPIT1aplDEcDFza6zo5VQIXJEv6zXZ+b3ILfA2edT1QVMmTeKnIgyb+CJBgEoV/xxQQUUiB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/plqiMQSh72ABHi4jovtL/ZPIxnlXbVrWHdqkA1BUhnfyvkVpb
	KPkosvt39uaSJsLqDARYkzv1m1edimUtej1ynGDInjsX8E030EF+yGWh
X-Gm-Gg: AYBFou2xE/T0cQ8+nIfh2jxctY736vLJc5hqQ+QKEbvO/Bp8FAMpkBYULXc0d0xXnrl
	yXRrXGSWGDRhkPkfe8mTcyJT8twPQZ+EVjcgovZ2zCkVHUWHWYIHHd1ts9phV02zh+eeG6KOBP6
	fWoOEowcZN3wy/lT0o0lnouuLak/n5o3I5mwXM4tOn1IFONwec12i019ihCbni/vHXEPHJa8iGy
	SOWRowEFdmVT5DWOY7XGgmspDTsr6M8qahVhqfIJ0E6syxDjAKIcNZ0e10l9sRfXAyjetioUaec
	OM6pY9kt1ujiFnDxkco0hd9tbotNh7jdN4J4NxX00GysNXcaAGn96oVIvYMCoADXgAAePdkAUR9
	0AR4hFsz7h9wS8/pomezX1mYqY/iTs3AxVSHmF6wOrxnBC6zLGSCrkBEUP3uqkk8GcnCAhlyQal
	Ex3hvg025WJMnoGXLV67Z2MZhAEiueP7uToOizcfa5Qk0uu/rgJU9nUEv2/PfUU1rI4e3NwkbHD
	cw228uPmRY1kdfESUE8fOYCtt3DSrPPYjpuD75NqfWlg6DkeQiXkgCn4EfcqP32NW7cEr//LTKB
	38un9sTUk/WDeqozfzh3jTkM07b6m4SSKc6aJoyFu8Ps5vWsSpb1qb+Gpj+/tBjg4tNqk9+qZRv
	N6Z57PJ2cV6CLDfQ342uCVfEmJ628pwAAzZ61K5/ibUmYFV4t5mEdtvxJyA==
X-Received: by 2002:a53:490e:0:b0:67b:f09e:da89 with SMTP id 956f58d0204a3-67c14249884mr916080d50.10.1793964884851;
        Fri, 06 Nov 2026 03:34:44 -0800 (PST)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c13540451sm1708137d50.10.2026.11.06.03.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:34:44 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] pinctrl: sunxi: A733: use the two-bit I/O voltage fields
Date: Fri,  6 Nov 2026 08:34:24 -0300
Message-ID: <20261106113425.28936-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
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

On 10/12/26 15:41, Vinicius Pedrosa wrote:
> this follows my question in [1]. Andre asked why not extend the A733 I/O
> bias code to two bits instead of switching it off, so patch 1 does that
> [...]

Please disregard this series, Enzo's v2 supersedes it:
https://lore.kernel.org/all/20261104-a733-pinctrl-v2@gmail.com/

Thanks,
Vinicius
