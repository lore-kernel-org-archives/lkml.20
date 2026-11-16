Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794787210;
	b=V8QP4rFJ/IqKsGu9wh7aMmYFgTLqwCHX917i7es+rcMzmCEAUhSiA3T15aDXDs1191+C
	 fMuSGi4J3bA/Yl7uikUe4zEJfGae6sWVxA/GoXb/m8kQSCXlonHJ83+4L1hUcmXoRDjaB
	 4GVgklATjovT4IupPJ62ERp6DEwtUK+eAOmrlcWC9R2GxDy2MfkbQxAkGPO6LNgwRUNSo
	 O6M4gw3nDXb698CdiPQX3MDVMcHkwkRgT/L7p6ggyrZ4N4tYe+DOOSvh2376aTZjEW0ex
	 KylqSaSFzxFlL1TYXBjfbxPu6b6fB8CRQAZPzUYPMAY4Pi77sc1lyHKoy8TwvEjYw8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794787210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=F0Vobei1EYt8zo7eZiXAiBol6p2SGs6zmAbcsg/JNog=;
	b=ulKTb3SfH9Wgn+wyanHeklK19bXDz6MsE3Am3UUXxe2yIA/8n7+GG57oZvHQCEheDJ5L
	 saKD5Z9S7ar9kKfbUl+iuKc0j6GxXNZ4QgC7QyYmqitzGbbmEJvxdCiQCiwreCC4u8t3k
	 i5dOWktt6BsNU7F05qv7ZhSMqnVC4++YQBg7DnNPswsCr/YT846NepBKZth0lP+YfXXvp
	 XukPngGOw8Pd9gvToaacxeUmK60urHAuUq5J4Xy08pncLHCpYSnetD+ifnPIzosM26gUL
	 fSUi/FfzHVDj+1DnDc9CT6OT5FI7kCc+3CJBRGNV0XIrbBzNsN5j3MRbF/zyfH5g3jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RiLIhjMw;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E86606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 00:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E86606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RiLIhjMw
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a315ed211so2753466eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787209; x=1795392009; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0Vobei1EYt8zo7eZiXAiBol6p2SGs6zmAbcsg/JNog=;
        b=RiLIhjMw292QqtMxqukW+S/5CfM2U9RQAWjuZktRDnYCgzA1uVHTR9ThyZtgPk+Y2r
         8vgW8iPsuK4kkLv6+x60X+hZGVp4bznXgdHkZc8jHyuaFi6UpwSnFh8h1gNUePR9414m
         O5+I58U71cl8fiNsxTXYWOOP7lgW1jTzP/ofdic/YtQprNjv6DC1CMfoiBCl2BDwMEvx
         F7SfPGyAdKe2zKJUQdWvJJe906S4Ioh6pkwbswS6VfEs8fav9HKqvWK7De8qWv2B3aKx
         MBGuyKTHABGZKRRPeYTrBRFzK/6MrzDUiSDjafQscptVpQvefr7ffsafEUxNc91E7Iwm
         C4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787209; x=1795392009;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0Vobei1EYt8zo7eZiXAiBol6p2SGs6zmAbcsg/JNog=;
        b=aMK9RtqNTqsJ9VT9DvY5xjD4OsoALVejYaXh9K7h0TGcCI2F06UBDO+HKHNvQOl2W4
         JECy/BCf4I69Y8KHyuY6lE2KT+eV7q/Jd0z5dwSNn4SId7S/W9RmWoqbvhrhxnqVrH/2
         5zGiQo/wV8/XTUjUeKZt9sBhsauYUxZh7BvAuHFOBVdYjst6TsC6SbMwZD+6YVzK4TiL
         Ap78340CANqwhNc5WStTQwhUphkat8m4BlgN/EWSyHSo78CWYjxB72GncCc5qbAWZ+a5
         zo2RaK5gI7Kfd2x3oJR6YQeoVGh5w7sYAKM0VxGiXX1nird2MwwYdIx4e7sA/YAeeQlN
         GL6g==
X-Forwarded-Encrypted: i=1; AL+hErEQ58oIJrLuVRbBsMmqwTMIwXBWxcPhiP+/HmZ/W81WEgqgluAItBICjsi4s6d0dKTwlXU0sC7s15XRlcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6a5DgdDoAY7Nw1jrjk6MkW18rGEMCSm+fzl+S7mT3Vz1mhO+D
	6OdQb0pEtonK1f2V/4l7rcIgOVfk/LL5htgPxvkdLJoZulXGpH7OC6b2
X-Gm-Gg: AYBFou0u8zZsj0ljRu+xsqA6p0yPNyEpU4bhLlqYLWFLltYSqldscr9G4pkA0K84ors
	RLqUBs2SmQDlfrP9E8yvbEenKTuTm6oJFBYQ6UIxQUga5ofp1hCXqYoNeSlqaIKHvIex9xd5md/
	H/7oTIjD92IhWoHqScS/RlHD+c/CWEYgv5rEIc7CHbo4kElB5Yi3rrgwC/m5ffwIKc4hI1M40LH
	LiXcknIgWTWn9UEQpox0rck+OuDE91HRSDSqA8MDNvYPBQ8jmS+coecvcKdaezEE+17c8nK12ki
	1uGvYMLfBXoFdONy23iKi7cHEHgpetb3kuTX6zSQ8I27W1SUYomRq/w4iPuexEke36+3gSMk3AY
	5kWcnCfiKbSeBz5K5EyPOeXDNuwhP1Wyae5b9OFigDFi6nfMwmpiweLavk/ECmVzYOiMYhAoyiF
	d5eKRn4GPR6skJEKqt6uqgcjD/Rw98pZiJYSZxjlUyIrXfvR8OE41bzPaF+cGAnHo4hpjyCbyob
	idINwYlG+IEVor04mu4Dl8kONefoQAetbFsLcCRhmU3FSB26TSVrBzjKSls4yVC7xeuV11sfDE7
	KfzegD9x/TYIIi4XqAlgZddnHGRvmNaCYfxKaB52HF3E2UT/XSv+elndTnlN5pyo5le0IbwH2Ae
	RMECKjbGgAqmg83Bjoweg2+O6OA==
X-Received: by 2002:a05:7301:1509:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-379658c798fmr8199108eec.4.1794787208729;
        Sun, 15 Nov 2026 16:00:08 -0800 (PST)
Received: from smalls.localdomain (ip-198-145-71-161.az.bambroadband.net. [198.145.71.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm32023039eec.24.2026.11.15.16.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:00:08 -0800 (PST)
From: Hunter Laux <hunterlaux@gmail.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>,
 "Christophe Leroy, David Heidelberg" <david@ixit.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Paul Boddie <paul@boddie.org.uk>,
 Olivier Louvignes <olivier@mgcrea.io>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Subject:
 Re: [PATCH v2 5/9] MIPS: Ingenic: Update Ingenic XBurst implementation IDs
In-Reply-To: <7FF80C33-895A-40AD-8149-70A7F5B42E54@goldelico.com>
References: <cover.1794471031.git.hns@goldelico.com>
 <2e21dc4889ec55bf210dfc205bfadb57acb93eda.1794471031.git.hns@goldelico.com>
 <f91a0c53b35ff28bed26622f46d562b5a6150008.camel@crapouillou.net>
 <3892D527-E3F1-49CA-8557-2C62E2C015C4@goldelico.com>
 <8da96916856e73c3ed368eeb8d28891750206a71.camel@crapouillou.net>
 <7FF80C33-895A-40AD-8149-70A7F5B42E54@goldelico.com>
Date: Sun, 15 Nov 2026 17:00:07 -0700
Message-ID: <179478720768.148352.14441091079180538485@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Nikolaus,

On Fri, Nov 13, 2026 at 01:33:23PM +0100, H. Nikolaus Schaller wrote:
> Is there some runtime check? Hardware capabilities register to look into?

The MXU2 manual says MXU instructions trap if Config1.C2 isn't set,
so that bit on the LX16 should tell you.

Hunter
