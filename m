Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794138457;
	b=CmY3wl5KK1eJptPDE3X8oLLdSdrJqE4eY02WdZxYt3ApoZdhrTU/sSiK6kvwtQ74ANtR
	 fvgWq7a4U4rPz4k95pK39aEx1/OSDIT/aMrr7T4VaxUpdheOEhnePOurav023KwN3ucJq
	 cOCqIT+V65Kx4okOONF0qygA3nkZlMqL8mkICd/YcVqKJ+hROc1mEahQwYZkoOvdnnLQP
	 x/R6cVuI+EZVoJRYyHhqnsOjUjOlbtJDr+IwoLJANjW/rfBX9KcrN7A7yqlETvbh++eWk
	 5QY0it/I0GmIfl5owerubh1gGN/5kPyfQ+y0U8onXWTx77MmyFNbX/SSyaAkYPV0qEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794138457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lSSFytxtbJbtyMN9RV4GYLmhr+794g+CxDzHCGkwhLc=;
	b=dMm0Qt0LozLcWwY96owECvRwgkwQ7lZ6DkYnzTZJUgSPIUPogEkxuf0tSeMZN5Dys3O+
	 +wwpgejZMt14RDoQww5p+HNRmZSs0k3cMOHCgFITdJaNyQDY4GS5JaCR61a38KRlVNVDF
	 Ao1VMblo5gbLepZbOtPokRRMDePyHt8a5hyUTq7nQ3+kBFuoB3Rj5YaaK8vV/wotfZxCq
	 WMLyfOMkz5QQ0fYxwhSa/Q0DCYWY4giyCI61Bn2FW09CSo0i0P8yDHK0cc0oUcX2Hr1tj
	 8YzIeoiBrxDMr53hirMXFz23Neks9ciEOL7VskSxidLm96p1v1vppdVgMX/poLIQzbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Z57TF2JL;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5676606A337
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 11:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5676606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Z57TF2JL
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso152947a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 03:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794138455; x=1794743255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSSFytxtbJbtyMN9RV4GYLmhr+794g+CxDzHCGkwhLc=;
        b=Z57TF2JLGRzKehJ8w25DcL9WIwuZYw8VvPJg3izSaGu7Hw0qY/tsbiMcqzEpvAxbYm
         FMoUwPa81R+EmeCD5GMfMhqzNzBX2CSVPpix6Gb/MgpFOpZYga40qbjiDWzOnwNwKHfJ
         5iIigxvEmJ5W0Hpag+A+y1OLQenf6QzXVT85rdXfzvdsGvhd45Iwhnw0dnwc6/Tl4oBj
         S76KW0HDDBTaZyvhlCXYYo8GpAErDZANe3LhCyp2A5+o63G32xHihYChakMwyk+9R3iM
         JNy/3F2zJgxWyp30enCygFyBTvXhjn8Jn4/5y46LwOgYeVWS2zWdBdxgHZo5XN0SOqWq
         BQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794138455; x=1794743255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lSSFytxtbJbtyMN9RV4GYLmhr+794g+CxDzHCGkwhLc=;
        b=Y3YEiK+HuYGX95jcyCEh1WelPb5p0o/HKwrH7rJ/TfEUfqyHIAnIkYCloTdAUzTFzL
         f+0MSkY1uYNOvZB/a9Fvz6EUdQT7FVHZ0Xlcl6/rf08JFFZZ0qMfbPE3o1YA3JzWX44U
         lNVPMq+xq5yt4svSPAn0DLTLWFLRoWIE3m56p5rjrp3mUPRDmCqh2bIL5GEmFDba1BNI
         5Zj5irqeWBPi6DHc3DRRmCNK36FtJGzPy+4/9mvWOVlrWWnI6UwbEu9nA3+1i2F9/pt1
         dSuOSQm9LiB8aeQZqQlq0fSVq6fkRNBVnltVAGobOrwyIbDKDrnp9I6RwTNp6VMOj1tH
         PWww==
X-Forwarded-Encrypted: i=1; AL+hErGZHC8RxW4jR7T8vZ9muwIM1Nk7vYnMiBfmMk986bkH4CtZRUp+0RdUVXbzrzVEDINMAg7fDTbhGeEM5XI=@vger.kernel.org
X-Gm-Message-State: APuU4Z81HpM+Ln0GjsWZS3dZ1FOgENKwepsPwJIJ0nrUI+ue7wntVQdw
	EUPfbiHpxkzY5smyArrgWEp6KdR2FCvmeqFk46oyrhWb7fcuhHpnBJ4iDAmnTpZvhA==
X-Gm-Gg: AYBFou1hXhOogi/yWflW+EU3ZtiUfl3gTXOyScU/OyKWRq6BnwgiXcDQABge5/YEfKx
	z7qF405q3mXz2oC25DEpD2w0ea/WY82tQ9SPVXpHiECtG1UQocYjTlOJbRADM95jAxu0ARldo+B
	obqZDNN3ahyOUABZdZxkfGevKf1zjwgosg+a/rlLgx0fERpVzCT9yO8aANgGYaBWIYlAeJLiOVm
	bklFqJn8qU97q6YB5QxcC6BiGkuAPEeDp322ASWAsOkiJ9zGRQvNfT5tmjKXrteBZ1bD6shlw7O
	vGe9JiYgf8EEu7bixEJRwt/kvg/kV01S3L5oNfeCZYMUzbfV5oRt6Kx/lpE/I3P1cMCHWH2jXUO
	OCdar24x1r3JCX9x9rbDzk4UZ3qHcmy+sKoWZoFEZ/+vdjQ20YVEmp27DgpIdJVl4bCvf7ZaG7U
	28TXN/wPhccnBDpVKVqE6dl1VtXKG7tAt+SH+m1z7D9vs3r5f77q5SKQ/pQt+uKIvN4iVg0GXnJ
	UvNJNM70A0io/dbXQv7DZ4+v+P6XWlO4zA3/OLUUbNepBb/SzJO4XNQ7dzXuSr5K7/fX/YsFHkk
	rIc8i4XYl7Vg9aTDX4SFbyaSw3Byn635kjTC6j6L4qk6AOXlKU27idlVwbFZRsEFxS/ZDsrPlut
	I30QySJv5+Emwl8kjA6sMrvYdfzuaY13qHdXpmn66spJ6QhebKfA/C/qQiXyK4qMOfh2TRiBQdu
	H/c+bD92kFKYQi/4zCIn0SmDzItn5++v298+ZnWNZ38djXPl+apt/T6GQHCtCotF+GF++sHHTD4
	PvgJFNGjW0f5hryKQ0OJyw9TyIP5jfXVGeTszCfNE6pFpHRuV+giqh0miIv+RmR60ijzyOh/J1X
	9DhDxoXabosCe2eKbw==
X-Received: by 2002:a05:6402:84c:b0:6b1:8316:ba32 with SMTP id 4fb4d7f45d1cf-6b722462bdfmr945767a12.17.1794138455254;
        Sun, 08 Nov 2026 03:47:35 -0800 (PST)
Received: from Desktop (p54afff19.dip0.t-ipconnect.de. [84.175.255.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ea37e6sm471177a12.12.2026.11.08.03.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 03:47:34 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev-bot+sashiko@kernel.org
Cc: razor@blackwall.org,
	netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	vladimir.oltean@nxp.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: bridge: fdb: hold hash_lock when an entry roams
Date: Sun,  8 Nov 2026 12:47:34 +0100
Message-ID: <20261108114734.123965-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179120418105.434549.6770789108608147842@kernel.org>
References: <20261004124254.3525496-1-julius@bairaktaris.de> <179120418105.434549.6770789108608147842@kernel.org>
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

(Resent with the lists on Cc; the first copy went to the To:
address only.)

On Mon, 05 Oct 2026, Sashiko wrote:
> - [High] br_fdb_update() looks up the entry with fdb_find_rcu() and
>   checks it without a lock, then takes br->hash_lock...

Agreed, the lock would also have needed a hlist_unhashed() check. The
patch is dropped: Nikolay rejected the lock in br_fdb_update(), and the
fix moved to DSA. DSA looks the entry up when it handles each event and
so treats a deleted entry as gone:

https://lore.kernel.org/netdev/cover.1794134495.git.julius@bairaktaris.de/

That series also handles the peer-site finding: a "bridge fdb replace"
that moves an entry onto a DSA user port notifies no deletion, and DSA
now releases the host address when it sees the addition there. The
MAB locked-port and BR_FDB_LOCAL findings are pre-existing bridge
issues that it does not touch.

Julius
