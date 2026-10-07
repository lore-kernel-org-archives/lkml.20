Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844E134B40F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397903; cv=none; b=l9+0hdQZMMNZTRQuLMtkEXWW3buzBBbwXrDZiy3ttX3WvQCgJ0jalUKGC0k7T7inULFirbsk3ZYlHFHKBOmJturqjzelOZkVPMva3n7T1p6qlruEnjb+5Kt4sCbL7xdoYuZYglnHqe7CdwLIT/nPfe5wpvbkypl6HXmmTZp1pqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397903; c=relaxed/simple;
	bh=ylbfZCyJ5GnjuZAJ6qCynAVt6R/JcI2NvNY/tgpcmdE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+n9u0qbwFcAnW7mk9nQG8PbHMrge9WZNBUizEuOMXGokhdsGMGzvL9MNzAdpEhvQmufk4D4O+1fFFyBVuNK0dZ+eE6wNlERrntxToLsk6PQR9wI/tVsYTRyAK5O9sssUGtPVIbQxnxEOb8beHJ/jQAGz75fPXxZXRKASa5sHp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VxoJ7Kew; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VxoJ7Kew"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c45111bebso1507186f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791397901; x=1792002701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IToOWKpumlGzZBC6qdR+iudjHnT2yIgjEO2gIjThpfI=;
        b=VxoJ7KewMRQqipwnaTSTsUQJZBCYjdjCJO27HHQzC8rzblvYQCNBWwm9lxBnSRCW3l
         FjY7niIxrQdTJvgpMxD6h9hBO3bvVwdBuy2sv2VjcUEKTT+mLM56P1a51PCr9Wx7eCYy
         EaNEqpATIPWB9GPS2IFhwksJMaLOEsUvFkFEDE3XhUVkEu/MjU0CkwT8behNodS0NSoD
         RtX6aye9b/OZS70ayI/0/zQ1AJUx+jlgwTav56AAcf2SvPEEdvf5J8XxW6dp9WbMJl12
         NxkqmKFXaDqW6vFxi4amD6yIqVOwVal3qHCM2CGidV8m694U8Bw/wbAjkLgiYN+mxyof
         wIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397901; x=1792002701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IToOWKpumlGzZBC6qdR+iudjHnT2yIgjEO2gIjThpfI=;
        b=ONnS5BELPdvK5YluCutxbaW2GT/lmzGngqhxalaC7nYJZZWmrqHD+2RpoD7mX88DL2
         FibFGHUDb/kWJNjbJNt9YOMlFDMLFAp60CbuLiTpS32PcIqnHxKB7mV+OAbtWQHekmS6
         pMUIkiWFORzQYKEEL2ZEvA0cC+k74KgtA+TgCM8+LT7CD5TsKr2GQsGxXjUuDLWkdntA
         92KJgNnOQ8pwnFLizhbhkZPtUAJ8ajuZoeKeC0cmKaIbPPmXCCeI7mDGewa5fOR42YCe
         Tcf7AsL2OEqnv1gJUQPBK1geO6MaKvDsLwXbIn8R+E/EdaT5ZDmd2OqEHXi+C+JOVrOV
         yfDg==
X-Forwarded-Encrypted: i=1; AKwUvBzmVoMQc844Ykxjgj002nghsQQrHvB2/rDh0UxQpposqD7YBOdlWNIiezBHkRFTQLnq5DUBw/zYNR/09Hs=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ/ccavCfDcDu5DtOqrU89CeG7+6tqjc2iXZ77xG9dF2DD8iBw
	ME5QTMT4JrVzDiuM8ti9ZvcX8MC6gGdaljQA0DSmC1LCicrTjl3vxjk9gA8L7A==
X-Gm-Gg: AYBFou1GjtYWJvxJI7QYKqmFm/SZKPlqrC6r7vIEzIU3g9iBfL36J4cdAcJJ2303d96
	ntZTS1AUtEdjG2RyFy95GPjCcvW+FKEKQ67ztaLWn2QUp19OBgiSTMAuoDtXYK3RFA/7U8nPNdq
	UhiV5DOzqj4rrVjJH26XFj6r7JsafqfGw41umL6Tm4LcDnjIxEfGRQVGsoSMoWgu49A3aUgqUkt
	f7NEWJdu/g38jUy6+7EwEcFtxKGTH/ABfanXGtrFU2tZHYb0lSH0stuIukCfwND51RregDojtSg
	kmuudAFC+2Y2ewS4iDHL2bQePS4rUweAhix1ODU1GDSiImOP6XN+PG4IqMNHv5G4dbwBalsAFxS
	jXk7LiY0CxyqM+zGzNPJg2b7XQf34E7NaQxJ/W0kfGP9CIsOtpMYYluacVkeG7tisxASNLHYUvp
	Ac0D0mZ9ascLv8ExC1lA0tSydQlXOOUAGBfxnxWQpJXOcOFk9ixqG2ZgAA/BbaAPY5Qx01eW0e3
	VAaFFYaxVKfRFmnKCVEV3tD59eDpga3Y3PQjYmAb7wnsm+A9MsKGk+ecsJc+qUgv1f9kQMNjz5I
X-Received: by 2002:a05:600c:5254:b0:4a0:1b15:8852 with SMTP id 5b1f17b1804b1-4a180310d31mr52003625e9.16.1791397900694;
        Wed, 07 Oct 2026 11:31:40 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71bd7644sm6990762f8f.7.2026.10.07.11.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:31:40 -0700 (PDT)
Message-ID: <6ac6900c.57ea3510.27c6b6.f79d@mx.google.com>
X-Google-Original-Message-ID: <asaQCSKjW-43Wp5m@Ansuel-XPS.>
Date: Wed, 7 Oct 2026 20:31:37 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] checkpatch: report warning with files ending with
 blank lines
References: <20261007122837.2995-1-ansuelsmth@gmail.com>
 <e8ef6959a0cb7093cfe4933da99fdfb5567f5354.camel@perches.com>
 <6ac678df.04a8e9ff.23fe56.b815@mx.google.com>
 <a098c4e66a4cabd61b8a7c933db7f21ad5648d5b.camel@perches.com>
 <6ac6876f.31081df4.3ada42.ff1e@mx.google.com>
 <3e05a868415881335dec29a5d73f7994393f7409.camel@perches.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e05a868415881335dec29a5d73f7994393f7409.camel@perches.com>

On Wed, Oct 07, 2026 at 11:30:20AM -0700, Joe Perches wrote:
> On Wed, 2026-10-07 at 19:54 +0200, Christian Marangi wrote:
> > Yes if you think about this, this will read the last line of the .patch,
> > not the last line of a new file that will be generated by the .patch.
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 70a11f2ff61d..0b9946c532af 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -785,3 +785,9 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
> >  F:	drivers/spi/spi-airoha-snfi.c
> >  
> > +AIROHA USB PHY DRIVER
> > +M:	Christian Marangi <[ansuelsmth@gmail.com](mailto:ansuelsmth@gmail.com)>
> > +L:	[linux-arm-kernel@lists.infradead.org](mailto:linux-arm-kernel@lists.infradead.org) (moderated for non-subscribers)
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > +
> > -- 
> > 2.55.0
> > 
> > It's to catch situation like this. Example for entire new file or adding
> > stuff at the end of a file, where a new line is introduced.
> > 
> > git am will complain about this.
> 
> It seems there's something odd about the patch content
> as there aren't any context lines after the addition.
> 
> How was it generated ?

It was just an example, it's not the full patch. Just the last patch.

-- 
	Ansuel
