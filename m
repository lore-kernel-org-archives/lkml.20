Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E29155293F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991462; cv=none; b=U4BA+niBPOWjZCT6ZrtvoWutkTVJjUkO+8v/CUKrc1xRfI6i6cCbBvmPuYAuvmbwcDfdks5W/zmjrW7G8S3PoVBu2E2ENWL8UDrMqMeqBf9jrLGZvQkFUK2bRdaClVs8fB1mWJjwnxfktpyhIzPvVGxohuvSJTS/A30bZLD3veA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991462; c=relaxed/simple;
	bh=AuomWEZX4AZzaXCJpww4x5u2oFWJ1CWj9oyE8+TmNiA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T1kSWO2IJWns3Ie4CE73PW/9gJofx0N135LWT57w2KzvgmVvwJ/AaG/uFv6qzY9FHuVprMpsUefLRX01HO7m/gzOCxL6luhod0tBEZee1E5Qp4eAYKZeBsuNKIYi8Z+Pg9tos3BmHpwuj+Zorp09TDrml+O2sw8WOPBtFdRb8jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=tim4LgQF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="tim4LgQF"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e934449bb0so7623565ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791991461; x=1792596261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oe+0IhcD+dLnpRRZ2AO6uP7D6+WkqiUo4+grQwp5VRM=;
        b=tim4LgQFznfakpE7Q77lOgtffIurbEZsGhEFewaNF64KSC5GqyLjgjbO/XaX49kEpC
         06tvI1hVJrCeUJIgInYdmPDsvtcQavZkZujTr2lYOH7iOTrifuVFP3mM/25GKISS2Uei
         Dai+m8DxizKQh7uqa8qX4ph3W62gRn7K9CrEQlLkh3GMEJVdl6JuPIYaNHCrPLTQk+OD
         LaObQwB2CuhtdAkeoihpH2QrwLWvFPXfX42zBQeZRqLzdT2nhD68PoUlhBA6OzNxMWq6
         wIufLcNo3vHG4UQbWF0YTDQquqeF69nXx5TiXC5PVPzDs6DedGU8aMgsv6jGMWF1SVEc
         DWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991461; x=1792596261;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oe+0IhcD+dLnpRRZ2AO6uP7D6+WkqiUo4+grQwp5VRM=;
        b=sK55kYyoYmA6EvVdTDgWS4i1x5igsEKN5pQ1KryzeVYAGhohcM/3CmO9bOLUtLR9Py
         eCNWbS1eCiaszAtJ6+/1gzIC/ZE4NKgJJ6lNrHBBHQmLAHKwyC1GV1hOZPuT3oaTka19
         8Bg8ZNpj9PsbSWnP5z2gGrxpjAjQdKdPupPkOwiOmb0Owuw2/WKFObwa/q5RhnS6hoUO
         g/i8ENYZxKtoITFivE1eDmjlPlYY5aLSOiHJwT9HL8PsjNBak8UIlL20uK01o4FrNb6T
         Tt+wzX92sP8/AdIf0vaDFcOMaLfkJZX2LQalrLg04kn/oGVgd5fjAqnUf9rv8gh+2EJo
         28sA==
X-Forwarded-Encrypted: i=1; AKwUvBzSCt4KsKHiAsTvJC7UM5gTPlFqICfWa8n71WL/6kPS/jYRVbuN3NfzjObXJXuJADaTbfss91oa0/KrsSs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxREC1XGeSh5UcHlh00f83oVF2z4LqUstlvQ3DQK6kwJbmbJqu
	WHoSmJLPzx3iLRrJC7K76bOeEax9/Su6JHWTyG9TVuN1djlbjaIu6kKVsUtryBBxoEQ=
X-Gm-Gg: AYBFou2h6UEy/DPlO/kg8YHE/XvKW98rd383r1RItQrgZ+R5i4MBE2RP8xowfuXlpmJ
	YkAcTggJ76+bRDBmU0u0pkP40xNZfuUAeEeUhbEZzArj8536SIXOgrfGBO25PLyqVUKzhWQGtR6
	rx2PNsu86B507+oHOitYFtjBJLg6HEb4sK0hRJDIWUy/tvF6oYQEEDZaIG1d289gVv43OOBlIiw
	Pux1kd7UKobTLL6oc/HqwBcAGiyq80YnYUNiFWUeS28m+166R6JXMrYDSm1ZiOOPFcrvgTu++7n
	5KJsDRP/AHq165qxVapvUfWWWJaPxfYdIwVWercSrM8FUUHIhuVxaMckrG/zK/fu6LFVdfxziyL
	f8weEDKq32GuN95Rk2zo8TkqtRBcrnxL3zz3+XBwgIJgZvl8mMkqMRlZyYEa/vGeGQM1JTeIQo5
	wZNDf7yotxd00XVLTr7ivSR601uZQUXZEDVM9X1clK401l80SYB9+2Xl5jXYqOB/JIePxNYKMrt
	V3vBs0e3f8azSZjWqP0
X-Received: by 2002:a17:902:c94b:b0:2e6:dcce:8222 with SMTP id d9443c01a7336-2e842f389cbmr147131975ad.57.1791991460638;
        Wed, 14 Oct 2026 08:24:20 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:1c49:61ee:8c8:3f4c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b298dsm69536815ad.33.2026.10.14.08.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:24:20 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: "Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v2 0/2] scsi: mvumi: bound two firmware-supplied lengths
Date: Thu, 15 Oct 2026 00:24:08 +0900
Message-ID: <20261014152408.3637388-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013173145.3412863-1-yhlee@isslab.korea.ac.kr>
References: <20261013173145.3412863-1-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please drop this series.  It is superseded by

  [PATCH v5 0/6] scsi: mvumi: bound the values the firmware supplies
  <20261014151914.3632701-1-yhlee@isslab.korea.ac.kr>
  https://lore.kernel.org/linux-scsi/20261014151914.3632701-1-yhlee@isslab.korea.ac.kr/

Both patches are 1/6 and 2/6 of that series, unchanged except for a
READ_ONCE() in 2/6.  The series also carries the handshake size patch I
posted separately and three more bounds that a full pass over the driver's
firmware-supplied values turned up.

Sorry for the two threads; one series is easier to review and easier to
pick up.
