Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95EE432E79
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791882921; cv=none; b=tPoolvRayxqMSavayg4SVm6jTyt2NrDDpyMxtia5n33yB5/tgXLhK2Xx96lmj0SD8JxjR4zQ5ah+ZyIwsPzOQbJ07PULjJJbv6CuaHSPtrpwjC+3qWx26a6JIR2YhU1kjjVr+x3vVUs/520BY92ee42QUXqw2dJ8J9mEqjFnzAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791882921; c=relaxed/simple;
	bh=0mBWqkKXgi82TW/5dFuvZSFqHl11Jcvei9Pr7Bfy3S8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WBR+3Uh1RfiayCTmGISb5VA1ehz8Dnwc7QkhWp7XPpSmpis3AmpnMexdaCFabomeAbmbfM+Qyg1AIxXGtXugqhOROXdXPFg6tFSjF4PnlCNmpyWLqg2YqdPzWwzkXnh0guONhPFTbPXemOw1AyTbguwnU4lxq0hnSE8Lp2Q5a+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uTVKoays; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uTVKoays"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a01d1fb07bso32003545e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791882918; x=1792487718; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mULswNbXT7INNy8Co3Xm1AZ+Ez0grnTmv63rIcB3NQQ=;
        b=uTVKoaysF0/L5TkiXzGlLRS+tF6bqXLE7JFHDq7x5amMwoNQZ3T0NWWIDlj/B7XhqA
         xvTRx1UI/FdDucwT2u24CA6GS8zPF91lV2Y2wipjBQRjvzwgXlbWIPwruyujvruC4Q1i
         0gTqke6/z+8QAl9cH0Jdrb7KJ75mUqNC39HIPcw3wzeoi3awAagsGl84uhYs/nMzSyQg
         3uef4ur679c2JMHdUdIOF+7tVvMot2bHLMdT3ANUbZZ/owucN8J+LA+HoTyPnN4rINzO
         oq/1cIQl3HrU0bTWSK5fqEpwI0DtCU6B6lMcspJ+QdeFeAdW936RH1HHgKo44+x+4ZLn
         zd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791882918; x=1792487718;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mULswNbXT7INNy8Co3Xm1AZ+Ez0grnTmv63rIcB3NQQ=;
        b=ZFbYhXxvlFjKi+KQpk6pIvJtsUZbml5oI1WzvRgU/JMeZRg3mmIdOF2XFnGrOgmHCb
         JWFQr9z5Pewwh0mtq4D/z/u3nYdxOFTCx0s5gDpZYOgU54yCfA/tjob04VcsiLoS+67/
         9Sdk0DzInXHPcXx5qpJNd0ISq13PZxLAUy8VSep1rOnZVAjZTzCgVbdufJ4TX97MqhGd
         KkwgbfnySb+CRkPIJDTBkCHF8li6wL4NGGxuJ2u35gdosGS7X4xCvp4oOGia1OcNkcbG
         43EknAmS4hb38mA0dvb4vKy1l0AB63JkTgkZY/sT6aAeadRtfiTFWo/fUIADZinARemq
         87Tw==
X-Forwarded-Encrypted: i=1; AKwUvBx1ZxWF70zmPu8J8WVEs4CFUHLlvXL1FjOCNg4bJP9HrzM4CX4tLA5iULn/5UuXZsUB62OTC5QeCZd9o0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0BIzGIW4vBiM8ZmMQI3Nqp/8Xho41CNlo8LUMg3a00yUXEwBG
	pU1XASMMOHvgHsI+ArKC4xZZK5E4HwAltFzmfe57QhxtkTjlmdgiYdrU/5+xW6V3VaU+z6h4C7a
	y8e50BzZLqzxwSXRKcw==
X-Received: from wmjf4.prod.google.com ([2002:a7b:cd04:0:b0:4a1:7a09:4108])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ecb:b0:4a1:76c9:5408 with SMTP id 5b1f17b1804b1-4a18e4a510emr241754905e9.11.1791882917542;
 Tue, 13 Oct 2026 02:15:17 -0700 (PDT)
Date: Tue, 13 Oct 2026 09:15:16 +0000
In-Reply-To: <20261008092906.179725-2-blum@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261008092906.179725-2-blum@kernel.org>
Message-ID: <as32pCFcb3ubN1Aj@google.com>
Subject: Re: [PATCH] binder: replace unsafe NewAllocation transmute with field move
From: Alice Ryhl <aliceryhl@google.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	"=?utf-8?Q?Nicol=C3=A1s?= Antinori" <nico.antinori.7@gmail.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	Sagar Taunk <sagartaunk@proton.me>, Mohamad Alsadhan <mo@sdhn.cc>, 
	Sergey Gordeychik <scadastrangelove@gmail.com>, Tamir Duberstein <tamird@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Oct 08, 2026 at 11:29:05AM +0200, Thorsten Blum wrote:
> NewAllocation does not implement Drop and success() can return its
> Allocation field directly. Also remove the now-unused transparent
> representation.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>

The NewAllocation type implements Drop as of commit e2e4a4527d18
("rust_binder: allocation: call trace_transaction_failed_buffer_release()").

See: https://patch.msgid.link/20260927125622.676342-3-sagartaunk@proton.me

Alice
