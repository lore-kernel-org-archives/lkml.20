Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46E735C68B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770479; cv=none; b=JwHTTUAb+rOfVqhQLA+iVBOdZQud3VGti3J0XZn8JRwNPiurUiNPd9fPRkqbXRK4NedktTLfd5qIl1J43W+c4NzYfrStSyu+KXKwnPdgfvLpYHj2ZJLRoCp0Z5HU2gEP55EYNgbOWpjhgt9arB+LESeAJg02GCnepTRJibJUS8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770479; c=relaxed/simple;
	bh=NGIFwKB33NxQy+k068R4T5Tm6/ogvoilF+pwjImbnro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZD7k+cftDF9Co8sGHbTNQK6tE3Odnb37/rNBA0VbaJS4zckQLA+2LmbPQawRon6SInaB6krlUNWyqDTfQ4bFCQk2yAoxPK7W5KYC6hFoe53RpuyplXi77VOcXEDGBGcgK1GHjOE0u9UsfepTiBxS99kR2Kj5uJfHUP3dr0Rxpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KohRcIls; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UeJT1TBK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KohRcIls";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UeJT1TBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789770476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YmUqK+rq52Mp671nbFhAqy/BcNTM6h9Cl3CLl+lByKU=;
	b=KohRcIlsj2Xw/mHhaFaC+4+1iyzZAV5REJigf2h1mlmAz+slLKoxpKQPPiU3Dz4OBibvnO
	d4BrHvIJXzqHweKyf/+Z/gIx32Gt2V4emBOx6RryLL3upf0KzrpK4IgleXz2SwDR8thYds
	kIBfpn0MxQ2xu+XDZ+lPSlt/9TixzXg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-MJiXzJotOV6t4r671P_YdQ-1; Fri, 18 Sep 2026 18:27:55 -0400
X-MC-Unique: MJiXzJotOV6t4r671P_YdQ-1
X-Mimecast-MFC-AGG-ID: MJiXzJotOV6t4r671P_YdQ_1789770475
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53000c06184so34615711cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789770475; x=1790375275; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmUqK+rq52Mp671nbFhAqy/BcNTM6h9Cl3CLl+lByKU=;
        b=UeJT1TBKtDviuUFICtm1oioVac1IdX3VT6qTKrTwTCsG9E5M2e3Czm38oAntgzsT+q
         dkyOAyukQpgbpnhnl4Oz2XyWBb2mZhwKtjQSkCdHEJ5hOqNM2PYPhdCYHtKK6brQBWPl
         3wINOAng70nK5eUiQ5rh8fuRKvFK66FkErkOOaCLQ7FqY0U+CtQ6CUTUTEyJvx/1g1uM
         DuhWdlS3QuNVqENd5EeFaqI5Y6r/f20KYMdAHGYxhhLuygr4zX0oQ7Lc0laSMhUKNtwk
         0tJqF/DNbctVIRpGcJU5MlcYo8GoP2cCLAHqP80lwdQt45AgUOsiRXHcUghOfZAHlw7N
         GYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789770475; x=1790375275;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YmUqK+rq52Mp671nbFhAqy/BcNTM6h9Cl3CLl+lByKU=;
        b=z46UKUJ4tjE3KMqYJxBAgPqTtaAMMxdMaFodji6Nv1SiZgjv0sT9NCuxogsk/CCPuW
         Mdl0AaRNikoc0tJfWOx920df5VcXUEUA5oTq/0+TAw13dJJS4jmUZydYhlGm+rjRqpvK
         lI4iq4ZtUm3pYTuVSy87SFR3PxGxb49UXUPEkS0nrAuyTfCeu1Uf8h3iC6yKF1u3+rOm
         zutxfqJ5+Pj0EmmEfiEp01nqEwbX0WDNv/7N3mg0Kl9Zmw7B7uBP0VA0OINjSzIcqKQB
         lB4WIK8uZ0m7S3EbQigg6jfYEpypXD/AwiYhdDEbqqQ9YwJAqB/KLcnuXkUGaAp4bgcT
         WTRA==
X-Forwarded-Encrypted: i=1; AKwUvBxuX209TB8JUSDNqFQ3+a13cf+SK9fQhVZ6QfqBNJ7HWcp6aWscc/iyhDJob5QEuVWjRyL6rrFMcxLmF7M=@vger.kernel.org
X-Gm-Message-State: AFuF++kN7gw/qpTt0N0eM7UoJtEP20TZIBTOb33XWWzJU204AsLaXVzh
	JUN8YCs2t3GOzEG0aEHBx52DjinUhHjBPQDl0UMFB9gXma/n5BCsOaT7SC53W6IAg2q22IWHKmt
	zZY/wAkaDbsgPvYLW4Sep8AMkxuqkDaln7sHM9WQBFgS/iBW+1rXm7SfAHNdUk1M/yQ==
X-Gm-Gg: AYBFou3Zt5RIH8L7EZEjRasNprjUong9XMNYblmzwg0ruWx7UY6gACNVddSkMtpR1E4
	/jtjVQaRopHPqFoV6Zoug6Xj/wL8Y8DKVmnFb04jweeW8ZP+1N9DUhJDdB/3iiF/jz62ejxRHTZ
	Hil2rK4UNMpXMlQTbe1XKO/oMFsYPR0k2adm/m1HM7Ey/CfWbhkJkHe1SenEKkL0zshYU9Z5TD+
	1afeG3zepkEC7nvoFUfxyCRVNCFUyfuxcbLO68XHQgPnhJbGl28UVKI/0j5axzP8dFnyno8fiL0
	ZmSpnGgrSsuPHy3pgH34zm30JHG4lF3fNe30t5GhaKYzYZNZKVH3lAlM/fv+0HBVlD6dm7o=
X-Received: by 2002:a05:622a:2616:b0:532:9ade:b6da with SMTP id d75a77b69052e-5329e557017mr77338871cf.67.1789770474799;
        Fri, 18 Sep 2026 15:27:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2616:b0:532:9ade:b6da with SMTP id d75a77b69052e-5329e557017mr77338571cf.67.1789770474435;
        Fri, 18 Sep 2026 15:27:54 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae750977sm7202701cf.23.2026.09.18.15.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:27:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 18:27:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: clk-icst: Fix node reference leak in
 of_syscon_icst_setup()
Message-ID: <aq266FMPwj99yVCz@redhat.com>
References: <20260915070103.1733176-1-vulab@iscas.ac.cn>
 <CAD++jLns9S7ba9G+wcnsfrDBjtDWbM-qzg+NeW9vHFHKcOz3NQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLns9S7ba9G+wcnsfrDBjtDWbM-qzg+NeW9vHFHKcOz3NQ@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Sep 16, 2026 at 07:25:39PM +0200, Linus Walleij wrote:
> On Tue, Sep 15, 2026 at 9:01 AM Wentao Liang <vulab@iscas.ac.cn> wrote:
> 
> > of_get_parent() takes a reference on the syscon parent node. The
> > reference is intentionally kept on the success path, but the error paths
> > return without dropping it, leaking the node reference. Release the
> > reference before returning on the error paths.
> >
> > Fixes: d430819d69a5 ("clk: versatile-icst: add device tree support")
> > Cc: stable@vger.kernel.org
> 
> Stable? Really? It's no big deal.

I'll pick this up but I'm going to drop the stable tag. It'll probably
end up there anyways with the Fixes tag.

Brian


> 
> > Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> Yours,
> Linus Walleij

