Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792427547;
	b=S3QLJGZKoRLQmzkOBofv6A7VlHJwYZrCPi92pNU5w3z9tXs9xI+GLUJCYs6yiAA80Ujh
	 7vUy8+HWMmXm2ZV+EBcHcx93LIFB0W1l5fcKDYJmVxhMjl6VGMMDLmGiuUMcpeom2uWDZ
	 FUlQXXkQ+LkB/Wn7nxPV4Zd8x3Sk1/v8dCRIFo0S0b2oPeoG3sZw79ZPcvcvKCB2mvHAq
	 wpCJG2PUCvgdu0veYJsSlVs/E5bAUc9Cvlf3qOGzk2igQd0QbUY4sKQrTsxN1+EhDivZc
	 I3WVcVBi4nCA0nT6DstfT31Ab03dsxiFX0T8JtLazPeIiWiFVTBUiHXumJhW+2EnFBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792427547;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=Le4PJ1qJhxmaIRhwFNQeQkknTjXk1GEFa9C29hi3dNs=;
	b=ZrnMNlKNJO8wy153LXMWmdw6AXumUI+QmnWOKAUS+6U0cw3SQbr2yHSnRH5ehvaFrSYJ
	 jf4TroRCf0EvQFpqSes69xDctGx74jK/MqZkdOjfOfYYCPakfZdfBh4qds5EX5hWxR6cL
	 bnm2sI4c8mmmsQUEKc/tjR268z8y57comQyE2xlOE3M5CnB+sUAd+Lwo56UXvzIzQq47k
	 Gtw/2ykP7K4pGynqh/sQ8sveU6nEMpa33t3DW3UTiDwv+Qi6sx09r6h0C+Nu5QzzcOYgi
	 wBYwqlk9Nw8uc357ZUMJFCh3VJ+isV8soerpi8CUfjZr58qZX3VP4i419o7A2qObJ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpnT6bVv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Jaj19A40;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCE9606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BCE9606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bpnT6bVv;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Jaj19A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792427546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Le4PJ1qJhxmaIRhwFNQeQkknTjXk1GEFa9C29hi3dNs=;
	b=bpnT6bVvqF+jUQnlTlzIUz349+gQbVPV3q19Wg0XLF62CafKwXURpxCpU4t+ok07Eswf13
	OoykFwjB2pK1nliTx2idhrMIFPNuCgczZVY+gv2RRW/6TRaMOmoz0lyWavawcPffEWA+LQ
	NDRQydgZBXIV893h495u7AAHwJU7nfo=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-7_m8YfUpOJeezw6lazLWbA-1; Mon, 19 Oct 2026 16:32:24 +0000
X-MC-Unique: 7_m8YfUpOJeezw6lazLWbA-1
X-Mimecast-MFC-AGG-ID: 7_m8YfUpOJeezw6lazLWbA_1792427544
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eac41ff334so1330683e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792427544; x=1793032344; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Le4PJ1qJhxmaIRhwFNQeQkknTjXk1GEFa9C29hi3dNs=;
        b=Jaj19A40NcopUc++brDNJ+pO3bte8j2rHirqQmv7K+N2ELjmRH3EG1lOPMumZA4LQC
         sKvmZ6orlM2582o/6bgCC0tzbStY0nlaiW3oCTU9dTzbmrmNPlGH2naaYeXAuwAimEbw
         5zVnk0UoUNwymZ5bfNFpqnoT1ezhgtlqTaIOt9JX485L500pKkSpjQfSD7wMF7uPrUfQ
         Mj+wSCew4v3m9cPL3TRogqakxIWIneHUmYOPhKIXu8keho4kKC9O2AEcLLu8TyJKP+CL
         bOMjf+ocNNWmrCBqhAtJGlfzIQwNH1neXfmX8CqAUGLoxmxIrqONN8dTuIRdlP1HLwxV
         pUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427544; x=1793032344;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Le4PJ1qJhxmaIRhwFNQeQkknTjXk1GEFa9C29hi3dNs=;
        b=DPH3YXbAXkKKGXr1B/lftIu4iuoV6N7LY9roAthRzrwEGI2bMIILKNgz0j8l6vLNDr
         0VzSUviG+OIcxROSd+9oPr5mPZVaS9pGl4frWdSOZu9HY79a4hVFsxzHmzvIf+j8+s70
         FU+t2km7CIWI75B6TPW4BfQy8f6xuihyV4NSG/U0zGZzhXhOpWO8ypt6pGHQOAJUsveL
         wakHegZVkU1+pX8CuNiH2XDuRRU5/nxpjJNQVqiM2aYoRBoS27kTfZx0BwGQsrfnzLTr
         F9f93SD6405ucxpAIgYw9ZbthXHeBbUFHeHkfcUxPIfCiRgFTf2O88LgFcouMynjFTqG
         REzg==
X-Forwarded-Encrypted: i=1; AKwUvByS+uN6TKar0dHr6dVaXDBYR7k3gB+iHnD+Qnn3JAHwvMQx61u4cJhuEaHuCDL9t54qGkFMnGDg04/mERc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ6afdmywdUjXzEuU123yjgh5XJyPr8bM2fjT2i/ZUckhgK57U
	ZpsUvDnh0oCs7UhDs2V+aXp+aoB4tihYGM5DDuhufHAxxfrv874HB/uithKS6SFfPkfIGOHvzze
	q/J/ADaSrM61at+DNxi9g/ha0hquq0JsJgi7SA7h2C+EGHnycNRB4tgGOdA3bxCgBig==
X-Gm-Gg: AYBFou3TDPJMcL1sCNkkKlxFg2gDCYCJEAoeaRaWRp7VsCn4/FijPue5KLcyS17LElF
	ZVNy5pN5NumgLyvE+xGTOokobDiGh/DNZqza0qKWCjeTbjYG/fDhVyZjmbOcPLxzI+u6v3kHOmA
	Ln6Md+d2Rs0KW11MB7nw5yOptnA37ymm50mC9v3Pyw9KBTSnfihQyC07gSe3GAR+DQxdVO1924/
	OTtuKOe452GN8naG4kgVEygs3nVrQ9lI73e9H8ZKdJxxvHj+8FqLIkwPEfptSCPv1K6MYg8Aggl
	1jPFQOX7QNwb44E7WH8gBgktZTm/xEQKM83V1s6I3/SJigeNZbD5bXZGR+eYHVLrpmJyaMc=
X-Received: by 2002:a05:6122:1d07:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5eabe1b1e5amr1473605e0c.13.1792427544289;
        Mon, 19 Oct 2026 09:32:24 -0700 (PDT)
X-Received: by 2002:a05:6122:1d07:b0:5ea:be1b:1b24 with SMTP id 71dfb90a1353d-5eabe1b1e5amr1473594e0c.13.1792427543871;
        Mon, 19 Oct 2026 09:32:23 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eaa42c2ab3sm9170267e0c.9.2026.10.19.09.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:32:23 -0700 (PDT)
Message-ID: <4a2c667b14fafad7acef96af2585e41f158fdac0.camel@redhat.com>
Subject: Re: [PATCH] docs: remove Assisted-by references
From: lyude@redhat.com
To: Theodore Tso <tytso@mit.edu>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
 corbet@lwn.net, 	skhan@linuxfoundation.org, rdunlap@infradead.org,
 federico.vaga@vaga.pv.it, 	apw@canonical.com, joe@perches.com,
 workflows@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>,  Justin Stitt <justinstitt@google.com>,
 Carlos Maiolino <cem@kernel.org>, Jakub Kicinski <kuba@kernel.org>,  Jori
 Koolstra <jkoolstra@xs4all.nl>, Brian Foster <bfoster@redhat.com>,
 Christoph Hellwig <hch@infradead.org>,  David Disseldorp	 <ddiss@suse.de>,
 Mark Brown <broonie@kernel.org>, Jani Nikula	 <jani.nikula@intel.com>, Jens
 Axboe <axboe@kernel.dk>, "David Hildenbrand (Arm)" <david@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, "Christian Brauner (Amutable)"	
 <brauner@kernel.org>
Date: Mon, 19 Oct 2026 12:32:21 -0400
In-Reply-To: <as7uqZn9rQ52USwy@mit.edu>
References: <20261009083137.3-1-sashal@kernel.org>
	 <0914a106-bacf-4d95-854a-bfeefbff62a4@kernel.org>
	 <asz9AeFe3CutP73z@gremlin>
	 <20261013123132.GC4214@killaraus.ideasonboard.com>
	 <as4pAEnLd4H68W4W@gremlin>
	 <20261013131243.GM56180@killaraus.ideasonboard.com>
	 <as4xMnT8a75pIw9v@gremlin> <as7uqZn9rQ52USwy@mit.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-13 at 23:23 -0400, Theodore Tso wrote:
>=20
> Using AI-assited priotization may have some collateral damange
> because
> it might not get the prioritization correct.=C2=A0 But ultimately, if we
> get a flood of patches from newcomers, the choices is either to (a)
> load-shed, or (b) burn out.=C2=A0 And of the two, (a) is the better of tw=
o
> bad choices.

Why is there so much talk around trying to automate portions of the
review process with non-deterministic tooling (don't get me wrong,
things like Sashiko help) and not "we really kind of have a problem not
having enough maintainers"?

The latter has been the case for years, I've seen plenty of subsystems
that barely have the bandwidth to actually review work and this was
very much an issue well before the LLM bubble. Is it not even possible
for us to maybe first consider trying to solve this problem and push
subsystems towards actually making it a priority to find more
maintainers? Subsystems like DRM have had this problem solved for ages,
I consistently see us reviewing work far more consistently then other
areas of the kernel I've seen - even with the onslaught of LLM
contributions. Considering how attractive a lot of GPU drivers are for
LLM contributors, I think that's saying something!

