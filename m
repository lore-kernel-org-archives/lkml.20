Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793387237;
	b=1q5dymb7MF5YND1zKdi0FRg3E3JyVRIYoCQxg5jAV+8eTo1orMdb8G0WwutZcn8SWzZe
	 dRCNEEta0meaXPzZ/QTw3LK7HC+8/BuEuAzWmvliGdhgZ/9alswPt4P8oM6ofkNjXEZbf
	 LSckPcnSkThNSqiwI6XZZJol73tuI+WThpg9MY3QlFS6k12Asvx6Zf3CwFKZyo3mE+gYL
	 q1qWMWlWMLa7qs437oeG1qBxjuXimgb4RRqsEntAbyjhgjmjUoy7IU4oHLG6sHTNjvjJw
	 crgOJ25FIZ0LnKTDSZuijwcHBWKoxbih0hBsVYfe3Hm2H/q1uuDgZ+R4BpxHWsR2pNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793387237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=OCftNx47efIzs+YCBM+El8sBn0JBNPv/PH6FqnaTqa8=;
	b=idqf4XGYae4IWNncveMrQ5Ax7nniKnQUn9vJwjxAssVd3vuJtKPUA4Q7NDf+rubD4uuy
	 2UVd1VuzAalLPQrWTEUCz+3Yl07ciHBAWP0GZk3yTS7q0TMOcX6nN+ZBVzzYobUkuXabq
	 sS+so2+WMXGl7/SNgAjdx98Z4AChKzaGZmcGsfkrqLd0G+In1W7h9oldVEPwX4N8fr/Wy
	 U2K+KuTaSAZ7948JRPu3RLtt/lyC864Lo/tQEbKvTp0iL2OTIobEuzCkp30a3B1uowaDB
	 zR6McbpyQNGwuLXFBPALrYaVwBXZSq3Otmnsv/1AiAeNsMnxCOBkWkmX2HOAzqxeibA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jG7RPOnJ;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02663606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02663606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jG7RPOnJ
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso767920f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793387235; x=1793992035; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCftNx47efIzs+YCBM+El8sBn0JBNPv/PH6FqnaTqa8=;
        b=jG7RPOnJKiyo3F6OohUf7Cl6JQWWLnKEi8fLxdzp2dHRi9EWa4x/KsravX1CCSg+KU
         YcGIpZvLfEZNxAg2F58Jx+YKGKkqtMBT7p/4f8SBiCaI1vHsE0GBTChTEjktYyWKnYc9
         KkX21fwordXlCuFabT8RZ2DNNhVaihpCywh9gyPkWytn92/353ezfJhImBVbSHb/6LfT
         qNrEgAQP4WbtxfurLl3gNVt+RojTgVmZZM/y5mk6ij7ANGunIRWC9fB3vlNZGmbHLNP+
         4E7tEJ6LqlqH5LnzTFnQM+3V625h+CoDdm9dw3K5hynoJMZRJQ1Mcs9PQguLvjzp6wEP
         93dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793387235; x=1793992035;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OCftNx47efIzs+YCBM+El8sBn0JBNPv/PH6FqnaTqa8=;
        b=pnjYTnxeLhm8MLce8fr3sUm/DLhlyB/SUkZsvah9umxA8wRCN/P3LEZ5N2x876zY+C
         iNh1W3uYfBm12sh1PvvvNQs3OhlDrqYIER/ymqO4s2DEzvqQOEQV60gwtjyMCCsBESIO
         c8jmhKSlqYybHJm4xGALV0uCMWm0MphpcbNRfaVujvBf5gO25Iqtnfs7n5RJPNCRBdOn
         VL4l7u1tn8Zd7Ttts/g0I0ZE3dlCtOoQ4QkAMnK5cwgvwAb4q+NT4W66V85njVWwsHBN
         ErMZ0DBKvlFy9RBRN2//hPMg9kiM3IIdPLXkPDjEKmsPc5q5vkXNk3rAGc7Gp8WN2+kz
         li7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz5aqDFGNfpWjv6H9bV0JWG/FWqoAeLEaDQ1rMl6HuzWV61N2ndd0Gdi4na+e6uMsmcV4i69tmRnM4YqAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNscgLO5IICNJh6XUp0lf4gJo2NK8ODgq3gFpjNufHF2WfEqda
	XXz7yRJcFcZ+ZUmoPxOg7/mIuqLDX3QKAxzNTX99t3krp6g8v1DoqazE
X-Gm-Gg: AYBFou3DLPBf6d7Zd/3/Iv5WB4ttCn8fYSakvpLuFqLfVKXjE8dCki9inUwj0DasSMI
	HBFkALvfBJ+uh/WKfK4xKQe7DVaLKyEGdB6xdjDYgM8WKXoW3BHfC1igrwCT/nh5eWq3mCqK6vh
	Ee9OBys4CopbwRS68pNvjo3aDUXT31WviCtVxwJtdMsFf/2nFsdnaUKIwKQpnP0LkS7pXmL9GFx
	uuOcL8JkNC9knexqDwlPjqZsoUR1m+t1/SJ9hTCqOZTJpcrgENpX/W5mPk8Q+Etgsif9ofB90E4
	tJ3JuoXYBs0T3nZmQzZQ/F1h5OHnECz6ENu703RwnHnSoUAf7XEr1uYKVNxgZ98LC7h743LIRje
	N5iMpJLO8u0BynAaom/oxJ8+OScoRa0aty5OpYpVb9MugfdTcj99mbMVBEcDqJCcMEee5CuLLay
	a5pcJLdMIAclWooWNoRS7pyDcrU+6mtPsNo9OtMsKe3LAlwx96uqSWtbqYke4fElRh+PUWCj61c
	xY+bYYeBXf3nRKzmtTSkAgPDofiivobzxBGZJiOru7D8KRJcQXL3g/DU0WFwXjW1jv0s83KshF3
	9SnK5cZ9H12AmDChnDWs8cTU8sPDMonCT4ZcQL6Wvt9BgXZK
X-Received: by 2002:a05:6000:e89:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48e6e4fac5bmr6104063f8f.43.1793387235182;
        Fri, 30 Oct 2026 12:07:15 -0700 (PDT)
Received: from gmail.com ([2a01:e0a:bc7:8550:45c5:9dc1:ecb:5d17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9eaeesm4813362f8f.49.2026.10.30.12.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:07:14 -0700 (PDT)
Date: Fri, 30 Oct 2026 20:07:12 +0100
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: bpf@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	linux-kernel@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>
Subject: Re: [PATCH bpf] libbpf: Enforce program limit only for loaded
 programs
Message-ID: <auTq4Fhs8T-lO36-@gmail.com>
References: <20261030092248.7388-1-mahe.tardy@gmail.com>
 <CAEf4BzaUg_KPB+k14ntDTaqU-3hEUQ8o5E2hSeUkaw4xwFwi9A@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEf4BzaUg_KPB+k14ntDTaqU-3hEUQ8o5E2hSeUkaw4xwFwi9A@mail.gmail.com>

On Fri, Oct 30, 2026 at 11:35:41AM -0700, Andrii Nakryiko wrote:
> On Fri, Oct 30, 2026 at 2:23 AM Mahe Tardy <mahe.tardy@gmail.com> wrote:
> >
> > As explained in commit '259172bb6514 ("libbpf: Fix gen_loader assumption
> > on number of programs.")', nr_progs which is obj->nr_programs at this
> > stage is including subprogs and autoload=false progs which are filtered
> > later during the generation.
> >
> > Quoting Alexei, previous patch 'aac5ba0a4d52 ("libbpf: Reject excessive
> 
> we had a rebase, git sha changed, updated it here and in Fixes below.
> because of that patchworks bot might not send confirmation, but this
> landed in bpf-next, thanks

Thanks Andrii, indeed I didn't know. Have a nice weekend!

