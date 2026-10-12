Received: from mail-oi2-f10.google.com (mail-oi2-f10.google.com [74.125.231.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7E148CD7E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815550; cv=none; b=oOSxSIsIjCd5X4DHrI9tzvbzrMFwoabCHtj3OiTgOCLgDWKJKSg6v6HBQL8NuojAXNl5ce/0UhpDJUDsbb753qv2EJnUgcPb/pRT2eoAt1GNJP93aKsQDLJi2TC1/LtXKEEX59JwDgV2qVmbcoir5xUfUcBUHXq6216XA0tDaxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815550; c=relaxed/simple;
	bh=e2fOhJrZ340BsVD9pUrjFaC9s7NoDhBvMGTtN3hwKpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpPUljomvEX80jSPkd5crEA+0UXMWzWL4UMZxptlGc7sEX8/0cqlmtajtdDPhOMHx06kENWERmzKT9QS2A2Q03nMaP4cdoHkE1D+3zmA0pif2gHceHztf5SJBVK2PfottvWJvl82s844iHZBtyt/cTvTlAyBEDAzGF8p8F5MMCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOX44WZu; arc=none smtp.client-ip=74.125.231.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOX44WZu"
Received: by mail-oi2-f10.google.com with SMTP id 5614622812f47-4f6b95ba1f6so1154426b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791815548; x=1792420348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unxLWtZDs1Hx2NMfpZvXZ8snLJuNugXErlhhpg0Cpho=;
        b=OOX44WZubmegOZIxaqGEetW5nW0bFfXYmvFHpX+jSSx0H0CfNuF33KNh1VQ0SJwoR+
         iieszOtfzLlsZ2coXPyAG6Tn5y9amMYdrHBvJgPDH7BqQKu4dAQ4uglP8I2BiGDuEMZS
         KP7kD+dsf9S/P8FGIJI7h8dNuZPeMz+9UbuRwKn6ZnUYocUsn2CaQP9AzUwovZ27jHcH
         9gnANZ+mKamFpZzk6ZfDDPeizhHmZiKvMO1LlMGF5VBs92WWlYrTMBRn3TDzXqd+53id
         QVO9IudiQO3UtdtXh0HFELFw8T6HUfZBeVnykhNsgCAxtPab35LGWYHAC2pybL6aS7XY
         7sVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815548; x=1792420348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unxLWtZDs1Hx2NMfpZvXZ8snLJuNugXErlhhpg0Cpho=;
        b=Tp8brKCnuk2kupaCVikQiu4+xXJlAhrx+IzafpFZbFqa2+BliRA67Niuz4LD3XWvNP
         QpHMmLdrNX6GKJCZ2fNYaHHbdisOmZ8np2kKotKOQiXCRJaOTDw+8I3sGCU31yQlH1ka
         otU1Je1niB3r+9d3YTravqokp3rMABbvN9iCK0LGiMF60z00TerzWZj1z8UoSJAcw0E4
         naEtUCNafXzswy4jsCk51eXXAjwMGOLLS9Qhv7mgrK/dMQiYv/oiceF2CRVvexaeIw1F
         g6GwhDYa2aGKr3jEH/mQW2P4rya+wVW/Gpg9GQJOYajzgki9gDx5KEzgnu2GVx1w/GCv
         ZJ3g==
X-Forwarded-Encrypted: i=1; AKwUvBzCd0byVAMN8E/DVqEWpbXgsQ78wlmOQGMh0qOh8qbC3dHhU7HUX2a+Jdj6OGlBRzHI097SY/UFdezbaBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5bNk1P6s+p+CQlVkTvKgG9MdFU1QXRDOOG9w1eczvTJbIKyf8
	1tY9LZ4KPTm9ikHPM4Edto7igUKhiMrogbP6J4v3CsISQBxGJA3hiOEL
X-Gm-Gg: AYBFou3H0iaFCYHyAu/lU32DcNxP3GbEM0H6PV9LB8VlhW9XCUFYdHl7+4cw8Wr3AH3
	wLETGjzR1ErIYwQYgbn6OazN13RZpSo90anc1OSsLK3yS6wbOrcKBbprfbOVpBSt6Rmqm8WZ87o
	BqABzGfM5NKH1KULNPoWz9Wax3sLFCIZ7m0tV5+QT1AzOR5PeHMfJd7b10o9mhxnc9TK+mOkTF7
	9ie7H0h/z5UfiFzg+8Rb5y5geq2XEDXpm4FrOBanDQhtXrpIW/lCH9IP4+IEar/bdMQXsOtfpiq
	foj2obAHcYFaMPSrhAOp1f3tgBDWl/rouoktZXUUMMw6jjLoCIEUBVmbkJiNzx/DCpLNqVOO894
	zNYq+8XLKrfZMWJC1oJo3Xj1Jq5cvq6mm23Neid/k0xy2vHNkiNUB95s3okmNjJ5cM3FeDEdeeJ
	XdaKFJUSt5Hk5UF94Mv4X9XFh3XZJj884Xt0RezbW9t2rSdN+p9n3xdJwrR0JcF6hPm3QhhOmxk
	MkMPh4HMI51DDOXf9B3GIciuzLQKkGySXOAomQ=
X-Received: by 2002:a05:6809:c1:10b0:50c:8007:8ef2 with SMTP id 5614622812f47-50c800790b7mr5438318b6e.68.1791815547936;
        Mon, 12 Oct 2026 07:32:27 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.37])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c1a325a38sm11578930b6e.12.2026.10.12.07.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:32:25 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: Alex Markuze <amarkuze@redhat.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>
Cc: ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] libceph: fix client panic on MDS message with data but no data items
Date: Mon, 12 Oct 2026 22:32:10 +0800
Message-ID: <20261012143210.1681034-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261012072851.3431644-1-amarkuze@redhat.com>
References: <20261012072851.3431644-1-amarkuze@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Alex,

Thanks for looking, but the skip you describe doesn't exist on the
MDS path.

mds_alloc_msg() (fs/ceph/mds_client.c:7384) leaves *skip = 0
unconditionally and never inspects hdr->data_len.  In v1,
read_partial_message() calls prepare_message_data() whenever the
on-wire data_len is non-zero (messenger_v1.c:1229); in v2,
__handle_control() routes any non-zero data_len to
prepare_read_data() (messenger_v2.c:1837).  Neither path compares
data_len to msg->data_length anywhere; I also found no such guard
in {mds,mon,osd}_client.c.

For an MDS message with data_len > 0 the first hit in
ceph_msg_data_cursor_init() is actually BUG_ON(length >
msg->data_length) with data_length == 0, one step before
BUG_ON(!msg->num_data_items); either way the client panics.

The check you have in mind is the OSD-side one, 98c4bfe9d89b2
("libceph: check reply num_data_items in setup_request_data()").
It validates reply items against the OSD request's preallocated
ops - MDS has no preallocated reply path at all, which is exactly
the sibling gap this patch closes.

Happy to move the rejection into mds_alloc_msg() (skip/reject
data_len > 0 there) if you prefer that over messenger-level
guards; I'd keep them since they also cover any future alloc_msg()
that allocates no items.

Regards,
Henry
