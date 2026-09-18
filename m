Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A693F3BD64D
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748175; cv=none; b=nIgC3rnUkBMd8ToeTpQXox3Tk11eccojwIDGQpEiQ0T7ecpNgAq0bAzD6hnDDi19QIyAzkeAhrKSmDQohEOGixtk9wZgfQMpGKvCtpuWdSn9kSgU5xA9cHlETEhMBQU9W1TCN7PgFCwpTBf/h/66yijyTCXfErGW9BdQCBl46Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748175; c=relaxed/simple;
	bh=BgZt53WCvRUv+SYL6NxC16PIrmwhlpA/RGPQ9pKg+mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPBA2TefpZPHbq5fdL6l5f7QKVl7kp9c3bKxBI0iWaHa0eTEq0XyNTuUfGauHO7cK0ZslvNNAdldryFA7lno3mI9Y4QTGqRtCQIP90kUNybTbOEd5SCjS48bujRdEZtscJ/fHhSjhLaQGA0hOBCljgjS76/XtZsNBAuXzIkk4jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W6RhnrnQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W6RhnrnQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so5698125e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789748155; x=1790352955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6B8E7hz6GF/wCS6O+Kavtr2HQK/zZKBI71HK4pF7l28=;
        b=W6RhnrnQlYRgpKI8L6tX5vifGm9N/jUjaw+bmCd1h12VFiVZIfbBKVPLLvL4LD5zj8
         U9W8IdryhSqBLxVyzd3imBwpMHkisPgHz70W1+VXZrXC+hXX5YXkzNw26IbBbVJlLJJE
         6YVtV1Fjw/ylXwaFDAj1NVKiiUCvfFpdHcouunB4iJ/Qybus7crwxAkoZMxJP27tfVcs
         44lDAp4T0LL0mWu22PeadWmMjLn/RRaSPKFz/6eoLHO/d/LHzFP24PMNO42ZmN+UfAkM
         ySPMgPny54Xn7oLoA82lXwoVVaVQ33lLLF+57L44+E0ZpF13faK+zVApJbzhWrC3POp2
         SEUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789748155; x=1790352955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6B8E7hz6GF/wCS6O+Kavtr2HQK/zZKBI71HK4pF7l28=;
        b=WUNPui0FKY1BZLV1g9tTP2Hl0RJna/AXC+Zy+V26QLivj9ES1WQZaxtqQK7EQgGUcj
         Ekia4hJ60+5XauYxX8F19f8bvjkLdBtJlimvKjSDR1gtAkhMKTz6mIdPlQpndas0aUje
         7/l0zKEzOsIV9PWT53XU4sd3PQD1ejl0s78kvOGnKIzVuWgCJSYaZYtPsg9APMsFuzMz
         6kcaQGa2mE7sNMBxtcCLEGiltoCV3H5sh9TZQEaDKM0rCbyx66Alm5TCcvXjbLm09U81
         YEU35eIdDrWtkmjS7gooNwybhpNMTJ3zaVYFAcg/ydKkIGUi3Kip4p4c/0Jv12w9vzGc
         N58A==
X-Forwarded-Encrypted: i=1; AKwUvBwfpode0pYmnzL5BoZxuIt55D02J1Glsada6HW6RLzrnaHIVzrnex54FucoiFMiDwbGrBHfoefpDYEGbMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mNCt/rhj1hSaJYz4FcyADVtkJH07mkH2tvm5tovm8/wvEZJUPA
	lvPpuJDaTeEYmqwTSsVXvXNP2leIlU4vpAyXpdOg36Tw7gbHzV2gszj9IqsavQEjOM8f6A==
X-Gm-Gg: AYBFou193vXPO674p/u+invbeuRjEycypSAHkua2IQu/knxgh0PXq281p5d/DVtlZmW
	845rCJ/8xn+MxJqqFCdKpo6WAzAvWypMWjfSwy9+8Lumph0Kt0wZv0IBlODkv5oMiJePwyn5oAj
	TcVPYUtoUbLh9FEXsSD2g455dSz7wCGTdSMzc2/vFnBYuXNpXyNvTZb/C3mwuLTRkwrGuQ6g6iu
	ylLn33q45QIB5hgz5CT/hq4DlwJAhxI5EZHYq9UgH/b0tEwm/CuCaVFzHpi0vi48GYLOKBJJBFa
	atS8PUTkMfTcH4T4FjgIvzrFmbwURJZATqPQAewbU7Czffejwta2buVi24nhdML/0sBDPcOTrv9
	BpjJ5EfkE8jcjkSvWrh8cAmn1r8N/c8u/n0bu/dDUkzlL7Skzj5p9waAHRp4jkXwLHjlSF+msyw
	ZbLCzPaAXxpq9yutvUybDe72IhufaW9XF6PiqFp+CT3gEz2kWOA3JlQPmHAVE1HDMZmA1ALiLEI
	9tSRQ==
X-Received: by 2002:a05:600c:354e:b0:49b:8f18:714a with SMTP id 5b1f17b1804b1-49fc57226c9mr37347285e9.12.1789748154818;
        Fri, 18 Sep 2026 09:15:54 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ec1e63sm44136965e9.0.2026.09.18.09.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:15:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 19:15:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Fix buffer overflow in
 uvc_mapping_get_menu_value()
Message-ID: <aq1jtSc_7Ad4v4eN@stanley.mountain>
References: <aq0siVcghDe6x9cs@stanley.mountain>
 <CANiDSCtiVU1PJh7=Pb56PNGF0s=cxfe1kVjwW+7O9JOT5CrDAw@mail.gmail.com>
 <aq06Kq-3n2R79YZL@stanley.mountain>
 <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCsVgGsbf0P6000Jgw=yCop580w61_BaVE6OxnBNXXDfSQ@mail.gmail.com>

On Fri, Sep 18, 2026 at 03:46:11PM +0200, Ricardo Ribalda wrote:
> Hi Dan
> 
> On Fri, 18 Sept 2026 at 15:18, Dan Carpenter <error27@gmail.com> wrote:
> >
> > On Fri, Sep 18, 2026 at 02:59:29PM +0200, Ricardo Ribalda wrote:
> > > Hi Dan
> > >
> > > I believe that for all the uses of uvc_mapping_get_menu_value we are
> > > already doing bound checks:
> > >
> > > index >= BITS_PER_TYPE(mapping->menu_mask) in uvc_query_v4l2_menu()
> > > value> fls(mapping->menu_mask) -1 in uvc_ctrl_clamp()
> > > BIT(i) <= mapping->menu_mask in uvc_menu_to_v4l2_menu()
> > >
> >
> > The problematic caller is uvc_set_le_value().
> >
> >         value = *(s32 *)v4l2_in;
> >
> > Smatch thinks that is called from uvc_mapping_set_xctrl_compound().
> 
> uvc_mapping_set_xctrl_compound() are only called if v4l2_type >=
> V4L2_CTRL_TYPE_RECT and then v4l2_type != V4L2_CTRL_TYPE_MENU. So I
> think we are safe.
> 

Yeah...  I have reprimanded ChatGPT and it says it has updated the
warning review skill.

This is difficult to silence.  But I'm going to ask AI to create
an tool to automatically rebuild a second temporary database which
only checks the problematic call tree and points any impossible
constraints.  That would have flagged this warning as a false
positive.

regards,
dan carpenter

