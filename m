Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AF13EFFC6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790020801; cv=none; b=QeTVWKoMRtiSn11ujKQqxY1R+9jgdReJAHfetTpOePiItqFthCRgQbWjGFAspa/bvcsML3ueIGftBQe07oTkuOtPgn7JV85AgTmTXJqkW0ib/mllbHD7HqXcSHrLsbA6xtoTrnL8eTfDfnYxjQ2Z6qVTD43Mpd/ZCLP+NWNaNqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790020801; c=relaxed/simple;
	bh=pRPVLbv4ZJGnEOtbzrbFm0O+U3obdPrLDdTIquar8GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EzKAnetZKkzrZRHoKD6jHsBeSupfcPOesuKml19+WsWzmuSAlXKuAmcyxfp559AStwLLvfSrkSJpGvMkKIELWwcSuYzqdWZWahmZRwfAX+diiXucKdrbvxrDHWa+BLTPh/sejno25PO/cFCQ+j+nBpMt/TyOkQVz29oI8vLyBFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MasKEx3g; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MasKEx3g"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d20963so2214280b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790020796; x=1790625596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEg+imKpv2AywlAvn/f88uirl1wkSJAtwjFAVjacduQ=;
        b=MasKEx3gIkKPF975fYGgUU+hfcmptxlyiNVTDX+Uwt0CcHAcYM7dDJCSxxUcYTvyLj
         gGV/KElRp+Y1O4Etpn32RSnZkjBD2OT42N6d9c9DIDh7/cHJ8OU18kpOXXMGbo2M4W1f
         bCRypoisjsrz+rrCxMft/t7q+c2CRR1lj+JvhwTXWa9siFtVjCjMmTZYjHR+x6KBZcZC
         W4tBSXIGvp/FfC6GXmgzan8ThCkJWgTTFwchl7j6R+4OApYzuQF4xuf38GiqM74HDwyj
         xT2nofk+7xzWF4r39dc7tLLU4AIkp21Hrz4LC1Js7hJGYcospy9HPSWnS0bI6IrL03QS
         1g5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790020796; x=1790625596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEg+imKpv2AywlAvn/f88uirl1wkSJAtwjFAVjacduQ=;
        b=ixhm7cJi2OcgOM1xQ4xSHl5RilmE+ezv972cam1k8Lx3F6fj9A8dg0R7QH0BjMgbGB
         CaEzXOIsuaJom28O9zA7VY0OJ/sEMj/Y+akvpj/HyaXT+U9epii01/6AIb40NaTsy6er
         ZefVDOzLcNcWK5QVCbmUKB6bAlfJePbfdpcoFDZVMIDk5q+ABkDbDN280mG6CYWaE8PP
         JKIYG8qoObrcjuncO3nmc3NmLHCX8cQBkxU4sn4mX5b6XJ+duDntTJJ/jkMjbN1u2AWT
         fLnh0T4QzBj2DbtNnU4ycobsGaaJyIYMTsQ0DSaxTvRWctXmx56uG/XLgeIUoy9qrOtk
         HEhA==
X-Forwarded-Encrypted: i=1; AKwUvBwQ7slvCIu9Hr4Jw02p44jK/IUbySMYajybCKXVWb24NjKvcQk48DTAkeRfpaAkUuKtKjB0kqc0Ku+PkH8=@vger.kernel.org
X-Gm-Message-State: AFuF++lfFZj9SAi1U4zGHUIq3ExxmxBixSEYyLWVo0QUp4oMXslw4CT4
	QUlw6IJY+7UtV7l7JAXvGzWGr/ovb4ZLX2Ela+8+nmYfSErBYKNEDjEw
X-Gm-Gg: AYBFou1+rL0iC/3uKNs8HHIiQwyctw0MuFfG1DaiKLcZqhqYZgU48YfqQJ35WTEILUB
	eWwW7r5WMtFNrgFYqGhBd7NVREyBAKbl4RNUcM+QD4wA1Z3vGNTfz57qvdQo6kX+iMaMORQJ/5w
	0QwPnfBAz64iMzlhTKdmaSg0l0bgsD1E+C9MEoseQmfwOSQ/9+Ps+lhy5o09pr9lDDLxPF2KHx8
	l+dwYty7jz+epL3N+/LQOrzbi89EfDw17wgq5E1DmY5nhKD/8RTiJyloFvv6DlH7+H5SvLWQYeQ
	UWIyzKkYBLDJWcNHZZh6L2DA1BdwjHUGzapCTmd0/imUt6Wj0qEhABtcZfWLuionl+UNuhOrJcB
	FcZrAi6To/Hzpc1zif8vZejD9P9wM56U9mcBdTMsEjHDLXZOjN8XxkstnVkuRrfEuqrAR1N6aPy
	ZXaul3GR3eIWROZNlH12ZCFmQ7UjviezzeTEjkkBqbfD5WV0zZ1Hp7az9uAQsWeQ+h8IwwUAEVI
	AC0UNNOXSOQ9qQ90OMjrpi6RA4p/Xri5SLjqcd4MQcFQlLiDvGV/0ADRuSY6qna+5eVuUGFcpzS
	CitbjpinH5uZQkks3tOvWXWQOQ==
X-Received: by 2002:a05:6a00:2e26:b0:847:99bb:b6d0 with SMTP id d2e1a72fcca58-874dcbf2693mr16386785b3a.15.1790020795965;
        Mon, 21 Sep 2026 12:59:55 -0700 (PDT)
Received: from DESKTOP-TJS95SS.tail460ce2.ts.net (36-232-198-121.dynamic-ip.hinet.net. [36.232.198.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87bf7aa8635sm18010b3a.25.2026.09.21.12.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:59:55 -0700 (PDT)
From: Yuan-Hao Hsu <aa9736195201@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	liam@infradead.org,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Barry Song <baohua@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mm/memory: reuse the whole exclusive large folio on a write fault
Date: Tue, 22 Sep 2026 03:59:49 +0800
Message-ID: <20260921195950.629-1-aa9736195201@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <arEkcIb7JQFd4zzI@gremlin>
References: <arEkcIb7JQFd4zzI@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 21 Sep 2026 13:36:20 +0100, Lorenzo Stoakes (ARM) wrote:
> Also, and I am struggling to believe I'm having to say this, don't
> completely ignore feedback you've already received which told you about
> multiple process fails?
>
> https://lore.kernel.org/all/aq1CjdaPUg_Fos0t@gremlin/

I'm sorry.  I'll go back and read the process documentation properly
from the start before I send anything else.  Really sorry for the
trouble.
