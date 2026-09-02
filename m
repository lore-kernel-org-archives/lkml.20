Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECBA44999F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390076; cv=none; b=LHlMH4b9Y8rrhF5Ql8+w2M165KsEJg98xnRuLS1R76wrxnc9qKpaxXJvoxfoXdw5gxM/Ly0imcNHqfABJSW6pMLqtSn3IbPYMHQmV9mf/ur+DZArpXLJip26tBRkrR8F0xXczSC+/l0SRIhAi9ZxRPFMVBHCvW/nKpZcFl9zPXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390076; c=relaxed/simple;
	bh=9e1W24omYlHjq6eNx9Nazr8L4uxhfDCXKimATpX0Ta4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NJvL5bORmPIESBuJUhSYu4m1xh1ynVUIjKQZ7xR6JLWFz+pBw6Su0tqRQhmoFsazHahV5/gbVFDJ62OtGZIGoCtYwugJqvUpAj9i5Twnh6Y4RSRX0+LrmGmDknu9cSmVF1cqKxRSwvoiTQO655tInfZ4N9Rnbe+V58q4Ob0ZKyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H+0AXW+S; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X3tqtpcq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H+0AXW+S";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X3tqtpcq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788390069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BIDgFS+vBh0lJu9tY1UPhlN/V++WcUZggMt/Ba9cLjw=;
	b=H+0AXW+SMQ6oMT2pfVrdtsR7w3xfi0/rrIdw8ADXaA7bWdBiy9PwMZxGKy7xH1LxZQFixA
	vXejj70ZTmNG9vbfEKU8Gaw9o15VgEaMXaVibHq9dWx06zCcastwC/CveWHzUgJtL9dB4S
	0si9Gy9v3ersG3KYoSfZCeSW6/hPA7w=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-7jw2po_WOjideMDjZKJfVg-1; Wed, 02 Sep 2026 19:01:08 -0400
X-MC-Unique: 7jw2po_WOjideMDjZKJfVg-1
X-Mimecast-MFC-AGG-ID: 7jw2po_WOjideMDjZKJfVg_1788390067
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939694871aaso161910985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788390067; x=1788994867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BIDgFS+vBh0lJu9tY1UPhlN/V++WcUZggMt/Ba9cLjw=;
        b=X3tqtpcqx7xr8NkEKNufavmdW19TbEN05e0oZmt0pslF9WbiTIpVdhxnSYpYI1wJLv
         Z0+dvQGHSwdn6vNo1cV4f3kJ0RjL2oVCm8kC50/Scn6I7Ml60lXk/Se9fPCnwwv7CWG5
         57mS3uljLCYoHFomrBzCdT/2/uBikgBFwYooNbTSh4BiVCr3NXsbz2hmjcZ7DvF3sl9F
         JqyoIqZ7uTh7ABOOakBYZz1A4jy9V6h3fDQDMbseSU40yxyDrZee0Wm57Uc+Kui7F2R2
         M9Uh9o/Pl6XdlkWWYwo5ltvPhJHyYoYWBlsN4bsfP0Wi/HDqlyDUhncl5/VB31h55Ut1
         lmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390067; x=1788994867;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BIDgFS+vBh0lJu9tY1UPhlN/V++WcUZggMt/Ba9cLjw=;
        b=NvNMginPIDwpZSZGhvxswkMpkj9DQ1/vD1JSD/NmvKgMw0YlUXpzDS+g2gr4KroTPX
         vyqnj+1bub5wJW0MAulKgrl4Eobq5flX1oqoDyr7FKnkPpToFz6f/VOhhM/KnjL7I7m9
         eak5oiaVzs9YLgbXyE4I3cvUCOcoktE9BoQda13Owmm8CciEBkX0DlCBIJYPTUrx6qun
         SiRiRS9vWlhPwykTI1GbNNfeHtPbyd4N8R9a6o4hiDJP70yLnx1hZcoVlvEy7QgmuIG9
         MRdkrMaV1nYxOqMFuLCzdv34mL0BxGENraCXq4rTiV4oE0XLBRne6cJ/1p3MrLRUXTkH
         2kMg==
X-Forwarded-Encrypted: i=1; AKwUvBycGReMEEdAy2Dosrh8pETVKvI3R7Toh7VvOc5OHAhoA03wCQVh06ATHKzruiPzZOVeObKvzcjuMrR41lg=@vger.kernel.org
X-Gm-Message-State: AFuF++l3EuXzkFJUgkoJ2raa4mJCfyVOViKt0/VFsVVgulLKMiEcmxrC
	Xb84yUtFF33AiiV0NhV13qpRZnGT/jMGd4d14/s592miNIcFbkGCsTtZTGQnmEp6d+wmElXITKO
	lIdeL2CXI0PiK0d4n9dfoqN/677lutsks2LwLbR55n4ev+z1SSfUVkcOCVud2HBXcvQ==
X-Gm-Gg: AYBFou2W3+g5hOloXwfv98tnNtCo6McW58t/vJ6KVfiDReQucWY0TpNYFXGW8cpdRyq
	CihSzv/hWszTITo279aaLqZuSJ4Az54EcJe+pNhsvQlxi97qbFJloGngUQeYTUZT5dClq95axL1
	gdBddzdI/IhD0h9D/HjJZCb+t/I4WOusu7DDawzNddQYgZ5J04hWNi5emm6iExQXv+CFKHz+rLR
	UYXHAwkcaHGHV6pVI+FT9Q8VOiY7ApyC2iNbUjbH5Ru+KPhCXegE7AUZb/yGWN5vNR4cfABkjqi
	oK97/Y50EIViRuC7B/MJnhHE808Hnwwi7O2XSwQH+2UsA1EQHmgZ2frAGlfdmL/h/ykZ0wIJGGa
	Y1A==
X-Received: by 2002:a05:620a:47b6:b0:936:576e:227b with SMTP id af79cd13be357-93960f3c98amr853629085a.24.1788390062428;
        Wed, 02 Sep 2026 16:01:02 -0700 (PDT)
X-Received: by 2002:a05:620a:47b6:b0:936:576e:227b with SMTP id af79cd13be357-93960f3c98amr853562585a.24.1788390056942;
        Wed, 02 Sep 2026 16:00:56 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f3fb661sm329267285a.47.2026.09.02.16.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:00:56 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-clk@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 David Lechner <david@lechnology.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260902222012.344765-1-rosenp@gmail.com>
References: <20260902222012.344765-1-rosenp@gmail.com>
Subject: Re: [PATCHv4] clk: davinci: add COMPILE_TEST support
Message-Id: <178839003514.2070477.3906603898737560270.b4-ty@b4>
Date: Wed, 02 Sep 2026 19:00:35 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=279; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=OgE5HyfBbZfZREqUFdFX9d9wOYqAbnb3ymyqMioCpuI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJmrFoUIy8uJ/2PXbtZRe/bxIA49pQ/XoaOn3n8fs6em
 La/vvpGRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABNJmcPwT7dlrY2jokKccOqe
 p1vihMT+Jzov8ZeuvF77fClfXoOZIiPDrVtpcQvMijK3Ttsjuqq98gibgp32i+Qki3D/62WycVY
 sAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 02 Sep 2026 15:20:12 -0700, Rosen Penev wrote:
> clk: davinci: add COMPILE_TEST support

Applied, thanks!

[1/1] clk: davinci: add COMPILE_TEST support
      commit: 551ba775497e93d93bb849f6ee572ca768cbaa3e

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

