Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792783776;
	b=WcPvXxwGX+b79qR8B6rHUHn567bt6Iz9C2Rej2I9C8h8CYiuiTTSTzdlWbbtb30p8k2H
	 kvPfVlEOGZjUWuy6Lef7fzcUwvBtAb777JSnJR163svTOOjVdf49gk0kJt02uO8WQGPuM
	 WILZ2P7ykHu/OKze6BanoTw+Fs2FBbximDZnPC1JmnSWObpYnvspeXtEyhPjbl2hbKaxX
	 GwWHMwxs5JrjBJq79eB44h6whl3RmrpuJTx4/jObBcehMR2nvi3aAOWf17d/fbzsORuCo
	 H30XQLAVaJvtODjDVwJ5gNUo2STzkIfX29hVVy6oiFpPar0IP/X7EOIwaheJpyv8+5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792783776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6mn1Ww0z7f0hBkiKdxCSd+R1mw+SIqi/8v/FSNDtdzA=;
	b=2HF0Fs4mOO1ULC8F0mqrsahX763C8Mqmyq793Ff147zL5bVOdUSruqlDQw8HixbHWfAC
	 kXZh5fDXLRlHpn+igDA5kbLfkhQqNyhXU6AQ1dzRcJP2yXece5GZqSpwZtG5XNLVzMbuW
	 A5MFl9zvQkm6AppiD79SF84JQrWH2uBiyLnr/ZQMV0GQAVnxwFFGg5NNPFvKQiADIUd3d
	 n1dhElhUMDExQsw7ClcIlfY2VBEg3yyKliujoFIJWAoAQUVpu75eRR5wWMibEvGYX1Lys
	 bkojb88+qHz/G+KIScs4U3GsMirf0dO3BcGHHsYaeqzIBL+8V06GdkbanKVjwF3bibg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JAaq0BZB;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF48B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF48B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JAaq0BZB
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so1232832eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792783775; x=1793388575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6mn1Ww0z7f0hBkiKdxCSd+R1mw+SIqi/8v/FSNDtdzA=;
        b=JAaq0BZBYU6590Hp301BXikOqbIgPmYN5FbZMFNrRnI1i3Kml6z9+HOlsTtnxbGWAy
         fLPZfZLe3GsBc7cbkYgh1hm7YsMLLDCQlRvXuRb1PSqhIzH2HdyuzF28Ajed9ip36xn5
         CKzNCKxx+WPf4VGWU/ik9yLmR3ZxXMrdLv/7I6UfdhhZUH4KpxM+qkc05Gi9i38Vyjnm
         kykHOY9dB+tH5vHd3E66cRFwHeLMuYJdnVC0NpTQ0cBHjzdCKg241SaSdffUxrfDhQG/
         Xz/5W//qCWpneILkiThyMn+C2D5grA38zxGiH+WyTLevi0cyWzgBSp0JLCareWCWF1yN
         Ipkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792783775; x=1793388575;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mn1Ww0z7f0hBkiKdxCSd+R1mw+SIqi/8v/FSNDtdzA=;
        b=mSqqrXux9520aPJy8qBESFprjLhXgfYHIz5evnty3eGrDJvUh0R4XYyb8F0QszwW9k
         vKe2X5zr3RovjLx+RVf2Ue/3TsDwRelXluOpqL4/X/U06qpiYZHybM4i1iwvez6ELMxH
         768f0R3zhVc7BPLhjn/x1K6mX8QzZiilxGYoiw+fEqxzXcJipSTX7AmZO+fKcZnhXABP
         gkiZf2hgssQnEFDQLhFXpYjnaPjDtVPezxcstEE8IkRQY+68nFPLOzwnH/lgw07D0Mh0
         32OnWgyyCuE6nyYXlVMQM7aRm4ZTcNkCMtBlII1BxV7Yuc2QQP7aVJEhFJQwOJj4iOYt
         osMQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3gXf5B/RqWYKijv4zh36lvbRZmoXywgdCrm7tZz1s+QcJ3yE7um74ACaM/cKA8lIMOnlvnm27DKIo0zg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDynAcsdFuX5AC50dS/RwWWnTlta6Y/OXoo0FH6s+Aaf/TT0Mk
	qD/AwyspXa4XKcZUK/uYZALQs8c4a994WNpSPfHAyHm/ak4kbvo64BX9
X-Gm-Gg: AYBFou1VfLLeo+/oqeJjJDLv6GeP8f5ogoPxkQey5FdinloscQ3rU1HIE6xAUfoV6bh
	NGoes2v9T6KH7Vm4lnMgLDkswGlQBNj9OhiPQfKPy7Etc90/lwX684H16LrqNoL34+RXj5TvAP2
	0IElhPdpaxifADfo00cG+Iw+MNX38zlmVB+NvWV2NBmPSOPV9+bm/HpC/BrVnG+6c+QAND+B5Im
	9xBZMOEZWc2SNpu36XNjJU2CJDF2rOgkxHjIoHP6x6WPqQWS6scSiKDA+EiZu18VLOggLoYpr61
	wVGorOAs5nWSg8mcSKCF4DC9F81oNmvP7S7ot/dsVFc0da1DNpZ8UQ+xvTBI/3Ez8nQMm1wXxT+
	UH2smglgUy1GfGA9y5kQqhTfLctMtLc9YbO/h9r6EJl2VmMVmvtByS0EcW0SU2QHSUG1u3jcJK4
	kh6BVdTWo6P28CKR9hmt/WdyEBY+20DCCQI1yH2A7ZBS7hmF3ks3HCzSO3PWGBhspTbDudMAxFO
	d2VmQLlBEjcRDdTZW846c3qPEGgqk/JzIdLf5ktN4lSONCc0A4mXaz50ojACH2ckNqRVqAc7hWT
	SdgD0LeUGfwSWj0kD087pGAeqH39tugqGxXPwmWSv823BVQzCyc7q07NnVSFDiIjj4Nt9t4xCzd
	JLERWoFiivxY=
X-Received: by 2002:a05:693c:69db:b0:369:8d31:a902 with SMTP id 5a478bee46e88-369e836af38mr406889eec.2.1792783774526;
        Fri, 23 Oct 2026 12:29:34 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec9276sm381308eec.25.2026.10.23.12.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 12:29:33 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Sat, 24 Oct 2026 00:59:26 +0530
Message-ID: <20261023192926.228467-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261022140615.30710-1-kapoorarnav43@gmail.com>
References: <20261022140615.30710-1-kapoorarnav43@gmail.com>
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

On Thu, Oct 22, 2026 at 07:36:13PM +0530, Arnav Kapoor wrote:
> ams_parse_firmware() allocates room for ARRAY_SIZE(ams_ps_channels) +
> ARRAY_SIZE(ams_pl_channels) + ARRAY_SIZE(ams_ctrl_channels) = 51
> channel specs and lets ams_init_module() fill them for the AMS node and
> each of its children, without telling it how much room is left.

Please discard this posting. I sent v2 again on Oct 23, please review
that one instead:

https://lore.kernel.org/all/20261023185652.195025-1-kapoorarnav43@gmail.com/

Sorry for the noise.

--
Arnav
