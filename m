Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5493321AA
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788181966; cv=pass; b=HETnpTfHXa0WnSuQIxWwtDhN+qQxDsOi42oQPF/3ikklXzTIgj0iMtLHPYniHrDwRHFLDvwavOsLl/OzmITVVSLIS61o/8plok+Qnhxv46sQq6Z8ci+m1aprZVZ+NxqRRV9mGKqj3yFV2X4KVNeKO79hLoJmIXmlTneicG5XILU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788181966; c=relaxed/simple;
	bh=HysHiL2VRlqM9yAPSNQNOM34G5A/mOcb8+1e4IfygkQ=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlEALddmd9NekRfDA5dmox9totawaNpejfEZBmLxNMOstkfIXn/gO5vgj+UmfIfgCb454m8CQdKiJ9yWRh5gnxoyEI3J/aAl4WglT3rvXtHZv+WF3U3V8sEB+IWcoXhtNR9PgU+FOB4Y+noFnomvgCZXDVH4mt7vU0YnPgmJp7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VV08GCSS; arc=pass smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VV08GCSS"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6b1334a3b16so1343092eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:12:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788181964; cv=none;
        d=google.com; s=arc-20260327;
        b=V/CEu+cfKDA249D3oFthGjjamfvS/czBMTXqRySJv2mLdXbctRyYRS0fmm/LECD0+r
         XJw74Fdp9dJTGFu15eyW85QH9A/AFvvrnKEpXKukuvVXCIDNHPD+ZIuALnRB8BA8YMpw
         ye+r055XrYdySUYcTGW/Q90Jb0bIR/0sz2jA7tyZEP+PuJ/wJ+U278AHoIqGRKsLluPD
         vKXSA47gF0U8q4i6k3VxpNuhrO+p1/sRQborpc1lfGIvCXx7vawoWmRlgrO02A1qp/tb
         6bOG3iClS80L9wzvI4+EQRWZWlklC795FVxKetJ64+bULp4m6PXPx6Rtj0Sg6czDZ5OW
         AwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=6dwdlMhiwvvGNP0Nbpo0VofOYlqAm52W9bR3+mOccsk=;
        fh=zGW5HMQoOaMTuXZF0NSEJd1Gl+0JgnOC+Xizwgotm98=;
        b=QBDVqaUO7/i9jjEzfRtJ/Viwl53SSXaMkBLDhwhHUhj3zCiw2wkNKCuFxjljNlA9rn
         ACRNHMVAIhkqFreWLfbaihNoTiQnIHMJ4l8LseP6R4El/M0KqiO6V0R5ZnspBrTFaC7e
         jFj0lZ2QZvt1Be00F9rTamQLkeYONEeA+M68Cy/zVSzxUn4M4l185tUTfF6SJHE7dEKj
         sH9KS17wk6YYAN+YFgNAgqrmKlmN5Hagl/s5tYYr5v2YB86piRSYqJ/F1eeuGS96kfZE
         VwOTOmPDV9oT7tAg59288KszPNZqb9iaeswHo41pPgg79H/52soHlTNiFH6pVE6PxW/T
         kyZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788181964; x=1788786764; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dwdlMhiwvvGNP0Nbpo0VofOYlqAm52W9bR3+mOccsk=;
        b=VV08GCSSbfrHjcHjIU7kpu3/DRyWom83v3aJm96eETFzTCLGSqx3rukmZrIbyLigAc
         emYI+CK5E+0RSSEKyz5n8L7TKQUkNdQM2fR2Irs1TYhdD7X627+b9K3bpfUL/OMXo5cx
         13382coWUe+MIezB2Y6qWK1UZCXBK5JSA9FO9+VsyYGz5VbqxLmtEamIO1iQdRVT+geO
         mlVx71hXS0TMu5ol/WMBqfFNQQvxfjzJAbZJGUrTrbd0H8otCtA+Q4i8fgd9jBG4JWNF
         m+YBa472A3cAdBPhbYoqqIcsOC+/nRT9RnwxDBEbqrwV4OCChgBkNTBNMVTeMdBKIKYy
         a43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788181964; x=1788786764;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dwdlMhiwvvGNP0Nbpo0VofOYlqAm52W9bR3+mOccsk=;
        b=NLYXtM9yDapGaCotX0gOCPdkylCZzJH/KuSOegyOog+PuoPe00SmmWFnpWjeH1Nuap
         kH8mzIIZVjUZIIXXKSsECJ5jvJbWGvQ6S2z/wpGYMImkmnniVl6O1fx3a0KrPhHF7zvE
         iaKYk8K911pMJkg1Yf/5L/p3f5n6N5kJfqhHqdRrgzBs+F1cnHttGhWP5VGQd2zB+Ryf
         lfbfTparRXYeZ82G7KIZBodcSEGQC7nQOfK2KXHGC5tgULFgg/nDcOtEB7vS+66DanU1
         KA06V8ccOaTx+wJx/Dm9upsl/uKTOT+7YyyHCigEsRaQoSl1brt8gN18K/ah83h/XG2X
         tSPg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7xTpkWt4qaidi/MV8HyL8zZvtLLAIQC4FSRasCKUeehDs6Wf/V3O6c7OeVtwQJ2qHCaDgwrBMIk0h+9w=@vger.kernel.org
X-Gm-Message-State: AFuF++lxkTESGQrZkV7QPwGUDKQ/AXlaEdQ06XxKSKh6eik6IhXwt7ax
	Ro97LTYNbP+fJpT1en3EJrEJen5wetI147pk4CtRjL42oqPtDR5q9bV2FQfysl+l7Y8VPB8P4Nf
	fVjuwXVxwoVzKbvFAkrBwc0MCUe8YyIo=
X-Gm-Gg: AR+sD10uNDE4SfJhPYzrfrgykp+jrzeMHEf3SbeyJ8uPtbDNmeAK3xZWuXqWTRmgAyr
	4x3rmsy4B53FaXQNvWxFXmX3SMSyLy5Ht062AKxaIHLJ9b7K7kxXHrrc72x33GdBHtNwHfmk8Br
	V26AuQJbnA7bgQ0CtipbDM3AaOxg7inpjRM+DIFvFMWnGmMPY3VAf2pV5QsW95LqyOafkZCX6l6
	YV9gLfHMl3ZVbXVnC9eqH1wTt9l3jW1g+6JmBJtkPa0bJazXjDVofgbTDsspkiFMcbzKN/UCGKL
	177CZCbmL11Tk0yDXq+/Iizj1EZLRzjQ31bTguDI9Z32Jxnl62W77vbW645GAblUxgtNb0QKhuB
	I0OXLaq9TrgGSzajUOz0krEA=
X-Received: by 2002:a05:6820:824:b0:6b3:6bc7:2ea7 with SMTP id
 006d021491bc7-6b36bc73476mr2621340eaf.7.1788181962932; Mon, 31 Aug 2026
 06:12:42 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 31 Aug 2026 13:12:41 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 31 Aug 2026 12:56:57 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <apVMALyPsJSsB5BR@ashevche-desk.local>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <fb26c4cb3dae5d87ee877dd558d6ea5e0b3926fd.1787933456.git.mauriziocasciano7@gmail.com>
 <apVMALyPsJSsB5BR@ashevche-desk.local>
Date: Mon, 31 Aug 2026 13:12:41 +0000
X-Gm-Features: AcwNN1WESpYlXZuMNQwNmJqDlEN047cygLvkqCI7j1Rkc7gQt6d8EHm-v8YRiv0
Message-ID: <CAO7O_xja+1XutiXhXUZ8k6+cF=P33htUVjxKZ1ELWR1brb4knQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] media: ov8858: Add INT3477 ACPI ID
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jose Maria Martin <jmmartinf@hotmail.com>, 
	Uwe Kleine-Koenig <ukleinek@kernel.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andy, Sakari,

Thank you. The use of ACPI_PTR() in v4 was intentional and followed
Sakari's explicit request in the v2 review:

  "Please use ACPI_PTR() for this one."

That review also referred to:

  https://lore.kernel.org/linux-media/20260828084328.257703-1-sakari.ailus@linux.intel.com/T/#t

Andy subsequently noted that the last patch in that related series was
controversial and had been NAKed. I should have called out this conflict
explicitly when sending v4 instead of leaving the rationale undocumented.

For v5 I have retained ACPI_PTR() for now. Removing it unilaterally would
discard an explicit media-maintainer request, while keeping it without
clarification would ignore Andy's objection and would not earn his review
tag.

Could you please confirm which form you want for v5 while the related
ACPI_PTR() work is unresolved?

  .acpi_match_table = ACPI_PTR(ov8858_acpi_match),

or:

  .acpi_match_table = ov8858_acpi_match,

I will use the agreed form and will not send v5 until this point is
settled.

With Best Regards,
Maurizio Casciano
