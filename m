Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792836595;
	b=Gm2ZB9YF6l05GS7Jb1oEAYJifxZUfzimADahDlZKp8T7uMWkZ4UKaEDfMI1wwj91YB5N
	 eKLDtuLPHaVFdrZb3nt6VUcbZHsSY/+tFS+alyMT3dcewF1KzIopJkOE2SHWogDCXY8/q
	 SKlVWOd7sg3UJhl22DgxZxUl+nQNCiPHgqT12qqCQIp7LX2FHlV2+jUlKobB/X6F2C8Cy
	 w8WxOuORkS5QxfHB8eQe/c2GFVZZ0F6wNZ6a8d6TPfv/kWerssq3S2MX22kxAledRjBZC
	 zh8LErDI3QsRbVLCqy9CUbDxuCvtc22C/W4xSiYdOpo5RIdxYiNJ4SB2ehS06W0oXlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792836595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gBmeT5JJ7GeeblMXaEFca81tlnSg9rFzTcGutmMmxPA=;
	b=TbIWHu50vM8Ng8ZgMdKUyD3dyPili4rlfe0fRF0JNv2hNgT5skWTWPr9E5B3TSe7QeGx
	 6Bm22O1lAjmfvHxNaYWlYmE1M24HxrxHpKbQRWC+u27dAZL4GQrD/8pJXYNEHloSwnvvN
	 W1KJhQoO9Qz1FnL5t4tMqFqZpxIkocl1Gitsuo2BY//PuAn+r9HDeU/D2hlcTwAyxcRnk
	 XWJMxXvXbM3UyZ1lUkdQV+Y0zxMvsYtve5JPKnEsq5BS1RoPmkYcGBdcYAP2zaKqwt7He
	 O/EgOot2LE6K1XcEnAjgnbU7EiqN1c0INuraJahFmvLy9dQESdadRRGy20mz72xZfsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TqAKNBFG;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D1F606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37D1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TqAKNBFG
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e977109392so8988325ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792836594; x=1793441394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gBmeT5JJ7GeeblMXaEFca81tlnSg9rFzTcGutmMmxPA=;
        b=TqAKNBFGu7Oay7kVjz7Sb1PxLYaXAZZlnGcKtDpMpW1Kkd/7x/OSpK9LruS07mebPB
         tKE1MRySUZvQYWM4iaaWg5mPC5JYbvK9zx8R50JsXjQCmWlk9va8JwWhVL/HqjZrFab4
         5F/HurqY1cuGtt5otkp9ge6GQ69QnVgkvSfIOh4eeuhNTwmPzbWuxQL88EPBGWvx2y7J
         J1oDcjYxDhRYkk1VETe0ofRev+SMfWEBuxl+qdIkIoN/26fgAPAO0ruvxdhUSsWj6ImW
         8KqUlV6s2/2rKJE0BlmvWgMbPJBeO/yFq74Z97y4/3qLCHrOL9crycND2eD5xdaVZbw5
         DsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792836594; x=1793441394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gBmeT5JJ7GeeblMXaEFca81tlnSg9rFzTcGutmMmxPA=;
        b=xZECFmY40xO6p0IyjzKDtTmFG3tulpLisiyGv3kzpVIux8/l4kkS4kdWAzj154+dL9
         AWzPNjyAzaZxIOmwhKgcsCPCu7L6vlknqyCAiZw/lE8lM+88YlCPFr+emUgoiBMAoafd
         tp1/xLsDc4mthEovNenyK++MMgl2yB1096b4h3Aa2iuBay90mwWno3j51Qpplnv19AIO
         wSeDLpy5j00GfXXNyH/SKZ4JMAgBOS7DuDe1oOeHD2Bl9S2GOXQRBIB+oZ7bdo3+8Hag
         Qu6ylSNFEASZhsGdVo6opQ+S8/01Da9seElBoQJYeywNE3cfgG1csx8Qi/hILcgt2RUF
         tNww==
X-Forwarded-Encrypted: i=1; AKwUvBwH3TgYlvkaLgmL42z7Hb9ZYLedFB+Aa96s9ZWHnOZpkP5fiR3fEXMnV084XTHI+E/5THOJFV9JDo9rMQE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZMQWT5Aj2WIfFzoiWCmDXPWs8x/kyO72ZCqmu5Sj1DBGujfhi
	S3M/J3aydr1gqjqXmnxSTi5LQErU/+Dha6ygGBde4JNNmi9hsNX5LSGf
X-Gm-Gg: AYBFou0em8VYuqNozCCpWc3pf7IJqK/a9OWLSudwyYjwTyPHrtzj2drIbozB4El7Ill
	Mf9sK/6D8vc5JRWRpS7ASUH7+wbRoU7bnoUqrusdhaKufng2/On1mwN8mXv/DtLEp7wEQJxNH6w
	S8Nhw7YKI2J7Du/lR/4Lb8Qf9T2t8EZh6+dALYEdiY6afWGEVwYp6rpS7GkC3+QuJpq53dkEexo
	OWBrgA8fvZhIKt0WzHh+rdoD1i6SpFiFzr2a2fHtgh/stB6TObwMAbdmEnsYhzApxAZTEWAHwF2
	gNoo99neMPaY9arJQmyUZP7lwB5qaNnaQWnpYABByaLUF4cA+efUabP97zGtcSdo4h+fozRRKws
	H1DvRakf6z7wgKJC8MPam+P19OOAagOJP/FRZV3RJ4DMLoeUpfPP4VJCYo1sm3BeVXOFB/Tzf3E
	XcAhPPii3q5EcYn0fEPvfzmrMOF67SzlZQZj80NgurwmO55wMxsBa3fmLIUez89bCn8plQ1HBkk
	Vfimkey0KsNpeVFtoL7KKinazm4l17Kjb0361pFThttXxxEDK8yEEqdL4C3SsUfnFbuoMya1V5s
	cb75W0I=
X-Received: by 2002:a17:902:d50a:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2ea9c66bb6emr12267095ad.20.1792836594441;
        Sat, 24 Oct 2026 03:09:54 -0700 (PDT)
Received: from localhost.localdomain ([14.187.77.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1982d2sm4635355ad.41.2026.10.24.03.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 03:09:54 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Mark Severson <gr3yf0x87@skyn3tlab.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: Re: [PATCH v2] docs: changes.rst: set the pahole minimum back to 1.22
Date: Sat, 24 Oct 2026 17:09:45 +0700
Message-ID: <20261024100945.34029-1-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261022014811.2803450-1-gr3yf0x87@skyn3tlab.com>
References: <20261022014811.2803450-1-gr3yf0x87@skyn3tlab.com>
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

On Wed, Oct 21, 2026 at 21:48:11 -0400, Mark Severson wrote:
> Set the table back to 1.22, in the English document and in the Italian
> translation, which carries the same table, and remove the Italian
> translation's copy of the paragraph that the English document no longer
> has.
> 
> Fixes: fd5425b67355 ("docs, resolve_btfids: Document kfunc BTF annotation emission")
> Signed-off-by: Mark Severson <gr3yf0x87@skyn3tlab.com>

Hi Mark,

Thank you for catching the mismatching requirements (pahole)
alongside the Italian documentation update. The patch makes 
complete sense and resolves the contradiction cleanly.

Reviewed-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>
