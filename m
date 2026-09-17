Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592164DDB56
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657997; cv=none; b=E76sG70tAdF6WVATEh17U1dDoxfKNxrok7fLZWizhKkLUmmEsUFdExBLC8nlG0JK7V+S/xzzm62XKiUF6aO5f6VOE3mkUs0bnTviIka16xKg5UoyKNBVmPJCsUPyHQQZFBGC90GI/menbDIMh5nO9KYSTH13PhoeqHddrKq5t8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657997; c=relaxed/simple;
	bh=nE3yOBYFFqYYkkgQfghfhhNaCFe7JvMndx4HdCjUOkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8+2WVrACxpAYRk+QtfcSaEt+uPyE7YmXnbS8wogaNN2zBoLL2CDV2OV8hFxQARFLJItD/QN3bDnaKmQ41bR5LZp48DXpB3Nn0PQHwmiYzdItevCLgr5G8Eu9eUnTIYZibGF5c3SGmoXz7QjSXvYOR+/lBh+FrrrRgaYftbVAzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=ZHQLtzjb; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="ZHQLtzjb"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efebso165804066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1789657982; x=1790262782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UXyMySlTneT5OxJWs5j3wToWbg7gTC+b+9BlWFDMiew=;
        b=ZHQLtzjbssryWleiIrc2Wan159dA1sxhddyC4uzrwIdod406QjnnvGONy+F9ZYCzID
         2xxoy6APpXi4qjTBnu1NvuMuXf67DnVPo9xcmN/llePi3R/tHuecCYwzuLvJjPvOpp3F
         Bv4QoopGQYlYGA42XP5yAOsSKQFNJ4su7dyaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657982; x=1790262782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UXyMySlTneT5OxJWs5j3wToWbg7gTC+b+9BlWFDMiew=;
        b=ogY5lRXZ43PLfR3z/IFmWPZEIFPfqhL+JY4KiIncW3lwsIEgIcu9miUncH5EnVybwp
         HChsORipF6oFk54Yhs/1U9PqnbqVS0SFyVTGop8M0Hu8Rqzs0J/+wmj4ATOqslQl42w0
         KL66JhC6EdAAlD1Jf1IuVtTxd0Rli3rrAx7dzXq7KFP1TOPhXCIS0meicAlQkVpAG1f5
         fE1LFjxJzo+jtwRlKMIHyN8u+9oY6cenqWALWot0ddlNjgfj/27ilkYS5JYIazCun5Pe
         njBdeYzTczuzJxMh2v+NuLqGOh9AW5CZ4IUsX3Eer2WYCsHlXV+PzECh55EpvSbWK/j+
         Fgfg==
X-Gm-Message-State: AFuF++nw7vYOJO3g1htrAB2Q1yiqtBhziQpem+EGUu7tKz90jWaDSql3
	7vIDLN4mI5PlxIzqHdZ/zhxDE1hAn9+6HG1F1cKDRdHL38sUg+qn6RywIlDEH2+5Ji0=
X-Gm-Gg: AYBFou1KwmRuxgCs2Dp7U8s7XAM1YV4oP8vbXCZfHYfCOCofV28JT356aGf1UfZ8gcV
	EkKmmQ+G4rQqjMrpewm/nFRjt+er6J7v+O/pPqKPOBUuY1cevq4xVbs/GDKATiehiosWi7eorkD
	yu+MzA0yzsTD+lI4HnhmEybXLz2qRtlEqvfR2Wixna1E3AbYS8KNiimC4qT5z9On03BrYlKq2fC
	R9PuaA2pzUVg0vbOHAhD+Rp7PKV2v5lQaHl4JNavFqvzXXwRcI6NGIZnKD5qPZBqLzuhsCHHXn+
	m0JvdQOvFwttPW+4vgdwYaYUUF/eAzVfXcnxlT1gShgjExgws2HG3cgcDNDcIEKBuLKX6JixATc
	/VOJq1fYz7zty8NTUxz+N9m/9IfxDKfgpudPc0mx7MPfSRJL8lvfe1uMJfPxntDhqqp0GKzG16O
	x90iT8hB/4zWbh43I4W7ZXahmtcUyt9GYvhmBIgdyI+Ql9AR/EWkpxfnnHm2iBHAUh/YeVtYzzl
	ehO3oA=
X-Received: by 2002:a17:907:3f13:b0:c29:4311:e23c with SMTP id a640c23a62f3a-c29e52b4043mr521614766b.28.1789657981872;
        Thu, 17 Sep 2026 08:13:01 -0700 (PDT)
Received: from cabron.k.g ([95.111.117.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29e801cdfesm263168566b.58.2026.09.17.08.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:13:01 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:13:00 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	dinguyen@kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add Draeger AG
Message-ID: <20260917151300.GE4583@cabron.k.g>
References: <20260915133805.3249587-1-petko.manolov@konsulko.com>
 <20260915133805.3249587-2-petko.manolov@konsulko.com>
 <20260915-swore-armadillo-12f821bb00fc@spud>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-swore-armadillo-12f821bb00fc@spud>

On 26-09-15 17:29:29, Conor Dooley wrote:
> On Tue, Sep 15, 2026 at 04:38:02PM +0300, Petko Manolov wrote:
> > Add a vendor prefix for Draegar AG, which is Draegerwerk AG & Co. KGaA
> > 
> > Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
> 
> A Link: to their website would be nice.

I assume the link is supposed to go in the commit message, correct?


		Petko


> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
> 
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index ba2002969373..276d62b848d5 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -467,6 +467,8 @@ patternProperties:
> >      description: DPTechnics
> >    "^dptel,.*":
> >      description: Guangdong Dapu Telecom Co., Ltd.
> > +  "^draeger,.*":
> > +    description: Draegerwerk AG & Co. KGaA
> >    "^dragino,.*":
> >      description: Dragino Technology Co., Limited
> >    "^dream,.*":
> > -- 
> > 2.47.3
> > 


