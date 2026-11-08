Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168330;
	b=cuCX9HVUasJ1/iFh95RW8sbbMTWlLa/vK8Z0YyDbSyEgVa2R7+0tkfDyiP6u781ipg3e
	 /klkd31eE4QgPLp8YhHozGNtvxP4DIgjbTNZj6O3MpG6i/fhIEMIfVQdiBfH+67qQYmeB
	 ySteALdCgBYE81kYVxflgDQVrSTPq0zNL1XhiznjUxT/Kc3AZXitlH7L8CB9IH6VBzm4Q
	 RIyTCRYedgJrB/YbDhj97J7SruP9QTp3CTK3FlYvKyYWH7BnVeMwoJKh2FNLce7d06NfR
	 FzEJXgrnjnHd2vG7oN/yG1XcOhEd9iJS67im1JmslngXZgPa3JReSdiLYWzzsfG7Ohw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
	b=kNDZwHyrV/M9Z6ByTgcBv846S/QhvrcILkLVn5p+NBAt6B4cmdbYhPmXS5YwCgQAYJpR
	 6K0NgxNMJvVXkqkMt9/2X+Z64DRAkraMEXv/Coke0/+uSYBxizQS7CWqeh9MxM45FuaVZ
	 xMH1Yo3qVhwDobZI19FCb2BHFSTYTLWtwNcfQ2hAfIsbVJ06uP7g/hvfMUdMO8qGnlPxS
	 7BVPHMTXy+PtVWwtazcmWc6vM3ckA8g2o2NcqQajldnVTH5hj1itucX0B/3A6HkzZFVnI
	 dLyHXuLF/f65R8Vod2HLIqh6YeygpUipXtktGVQtmSMAYcuJx0Jpv2Tevr5B8VzhKvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ib7c6P66;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55547606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55547606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ib7c6P66
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso1318905e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794168329; x=1794773129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
        b=ib7c6P66JcABRQVIYvbAfEuMzOdspSzPtZfn7p5hZaB2Rr9aWYVjAA8lHghOcTHkfP
         W1IBKWn61CtXgoJPbCEozcqCpgRPGxULcN94D7ITtmHErVGmr3isoGCQ02nfNqhbH+4n
         lUM22s4MKp/l6fyffg7/TutUQVALjesHSFnC4w+1WVPSvW0J5rknAYGDJAl4xvCRXDT5
         fBdxAtmJXU6SiF6lguNdvRiiwtq6Km8nyFGsRU6Tq+7fwVjsnnI/ZpxcJdUfsPAfNVOr
         BXFpKVyK/3a7Qj/Qjq4EwXbAdcjWWztzIsYea9a0P/MiY6n2EtEGPByGhhhA0f0X0qYJ
         P5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794168329; x=1794773129;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
        b=jWL3ifJax2fnk8daueFsrnc1qcJWQNACCF+iVuNDBq/NKxkQKpBtxhHapuVB1ufAXw
         9+99vvTJmeKwufcC9Ku5aPQgNKKHMNO+lNN0d+oH/rTw0lUGlR88yFG9t3r3+oGDcG3q
         D/C4IkozGk+6wY3kpaTmmA3smLMiHEYgzAx0DqHSTf/k+EW96G7SH1vjLLzmWRKvGllB
         Vih5M3faawGy7gl0tAIIKX8VOMeLeQGvllh/vYTJx7/iS8U+LQx4zGowpL/2JR37iz/z
         o6VayI2FltwwfSzQrV/x8k2N44QcPilHMPK6JsrQojaqAkrtZ3TpmQ4R6aDTxBp7urIC
         FIpw==
X-Forwarded-Encrypted: i=1; AL+hErFQu8s9kjX+A8YpCNeLAiMcjwqSx8ARFXiLqqY7vVL8vTc4+/E6wmAqpLmg6ehjlJyn3v+/g6TVgr89fa8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Hk1MGqnfWn9BiEl8ZJXtuzVGPPNhzxfiDLnpMTJ1vDQCCPZZn
	S5C0WbwBf3CuXRxetNDsknTGFlQmh8H5SwfWmyk+uhCS2o59yXGJU7b9
X-Gm-Gg: AYBFou1G3kMqvnhyNSrU5KwZgyhTpq4r5rk3cwSkMbCTgPst25QeawHNmzAM4mNdSXo
	yA5iQGTrFdSgAbY9urvX81qvsEUkkAJ9HUCa3+BZtZUpBXZNKjCbb6YWu2ywOK+ta1agLWDUVvn
	lToH7ADH0QKOZat7uRYOQAThLurNlF987ia58xzqolVNqs8u0KzMjcB5OpczA6yvViQ4QfSRhuG
	4IAUppRCP1tCzXl9zJGcoRKtFdI7Rb2r/ZXTMHT2rarfX8a5Mzr/zXR9TquuAm4n1CV9h/xGkqR
	FQ17kknpGCwB6HwdWofDRuLn6xY0CvqFK4Yg0lFpA6ib0k1wSElAoHy81h4ynlHH7MnQhPHv96Y
	3aS0mo7FCMof4N9rHL+y8CPkBpVHCzfySZokVmacRxREkkoVUbX3lw0+IfVeCJQGRuT0+tRm+VC
	wcmudhyHL6uBkUljSSBH0vXf3VD8DEmkC4zQTRKyL6Cid1+abN0RM9JZbmJUUE5LHweBIQCOfRf
	3KIY6R7ip5K5RmA6KxER+COW6Mo/a8JdGytDIAjZmkLd99ktUqZEeA3/TndvdMPonHFJJYYvf3G
	bgY8MFoDJSvwEBtKBESpXruHTx5+OIpqH5eTnHaerccigU81CKJ2Wg2tzhFM3n17LYU4PjMYofm
	JbrG4D0/59w==
X-Received: by 2002:a05:600c:1c0c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4b963c69d23mr43591205e9.19.1794168328561;
        Sun, 08 Nov 2026 12:05:28 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597186ec5sm5768522f8f.33.2026.11.08.12.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:05:28 -0800 (PST)
Date: Sun, 8 Nov 2026 20:05:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 David Howells <dhowells@redhat.com>, bpf@vger.kernel.org,
 dm-devel@lists.linux.dev, fsverity@lists.linux.dev,
 keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-security-module@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 Alexei Starovoitov <ast@kernel.org>, Alex Shi <alexs@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Andrii Nakryiko <andrii@kernel.org>,
 Benjamin Marzinski <bmarzins@redhat.com>, Daniel Borkmann
 <daniel@iogearbox.net>, Dongliang Mu <dzm91@hust.edu.cn>, Eduard Zingerman
 <eddyz87@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, James Morris <jmorris@namei.org>, Jiri Olsa
 <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Mike
 Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Paul
 Moore <paul@paul-moore.com>, Randy Dunlap <rdunlap@infradead.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, Shuah Khan <skhan@linuxfoundation.org>, Song
 Liu <song@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Yanteng Si
 <si.yanteng@linux.dev>, Yonghong Song <yonghong.song@linux.dev>, Linus
 Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 2/3] KEYS: Replace assoc_array with rhashtable
Message-ID: <20261108200526.43579e2a@pumpkin>
In-Reply-To: <20261106090516.GA1973@sol>
References: <20261105031401.956609-1-jarkko@kernel.org>
	<20261105031401.956609-3-jarkko@kernel.org>
	<27015846-0161-4700-b810-4643e1f7b63a@suse.de>
	<20261106090516.GA1973@sol>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Nov 2026 01:05:16 -0800
Eric Biggers <ebiggers@kernel.org> wrote:

> Side note: fips=1 actually has little do with security, and in some
> cases it actually decreases security.  See for example
> https://lore.kernel.org/linux-crypto/20261026183332.11402-1-ebiggers@kernel.org/
> where I'm fixing a vulnerability caused by fips=1.

Then there is the 'fips compliant' server we used for routing 911 calls between
TDM and VoIP.
Any kind of PCIe error gets routed out the the motherboard management module
which then proceeds to inform the kernel with an NMI.
At which point Linux crashes.
The NMI is too late to stop the kernel having to handle the ~0 from a read.
And even happens when there is no driver using that device.

David
