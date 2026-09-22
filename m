Received: from mail-dy2-f24.google.com (mail-dy2-f24.google.com [74.125.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C4C531AF8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790117841; cv=none; b=ZPYdaoxXmDirV6UqQiEdeK/UeXKm5uWcGwwH4WOF/f8QP2kxQEAs7P09sb+sdzK6os/ojOpxYixkXhVHioqbhYfsybDUDHP1P3jK/KssanyQGoCP/HHQNnqTPxAESROe6wyDTHTxHFkxufBJ2J9uwQfBu3cRXF66FpYwhHlS9Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790117841; c=relaxed/simple;
	bh=MlvWhc27/Wnf3UCEBSDCmF0Yz4ceH7CgS4IWEcLi5ps=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nbydou2FKQI2UaCy54pTpIZkJPjrLnM25UdHRePPdTe0w+lmlNxkgczcrmF8WZY+WOcUzQzzUjRQBsTINdF8TEvUOMMZY13Jjltov0csmEHuM0ocHgraQbKiBO5KV+YenKz2HuXJswTw3s90JEGw6MPya2yA29drckzYLkM3ca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=begyv8G6; arc=none smtp.client-ip=74.125.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="begyv8G6"
Received: by mail-dy2-f24.google.com with SMTP id 5a478bee46e88-328664dbdd2so107555eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790117836; x=1790722636; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aTPRvJvF/abYMEvNmlO3pHSl3zMEUYZicwYugH3SZJ0=;
        b=begyv8G6XJ/FzFdJuULE8br5tO1zsKNxSKio2GXNGp3dIV9hb9stcfr4ywXNyFJX/s
         YF+QXM3bXQltqABrbQoYNW96qG1i1b0kGQkP+kCLIebmoqibk2s3eic4FrBRgvHFRH0n
         1oc3l/uVcduHcR/cmTih1GhuhAjWQi+ej8VCCmndmWZO1aLrSxqegbLM4icqJZEZ4sIX
         XpbfONxu+hg85oHYIHhd0KALNi2rC5QPlAEeo/embF2vXIlBRRMLTym5D0lH/POVQ1op
         2TPcoVn4bVZLkuZp/8MK+vQkkdd59ANOnT3PGRK2dfPoAF9LRQYkzpt/Dyz7OgYjVp4H
         czCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790117836; x=1790722636;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTPRvJvF/abYMEvNmlO3pHSl3zMEUYZicwYugH3SZJ0=;
        b=iWDqcLBb0fzwcnTwsp+FRHICVMfRXOBCox2qOKyuDBXn7RAMU/iDDtKye7pu8/18EB
         F1iXDUERaQJ+PS1tpC6I4bwxVYWAt33+2Y6RXqXegA0Cv3NZv+YFLCA44ligBGGurRPg
         YUtMbVg+nhHZ3P5evDhPyO56k2YkpE97EfGDkxD/Tzot7U7r08sDk2qBv8CEnUDrZXX8
         XzEz0YsCld1lVKqfe1CjfVbX1uwGpFP9F35EWdW2e/1pZUOyllDjJCY+ZAQFRUvsLHsk
         KzPP1Fvxds6pLK7C4XyhUGhy1FAWAjEeqIAscG/JtlG9yxxkmTLxb1BXiWMvlLWhtWak
         OFNQ==
X-Forwarded-Encrypted: i=1; AKwUvByfTOEsX1O0A6yRCFJ2LJIxkz93MiD1rm5Wpuu4I0Oh7uusVRXL2z3Z1zRmfazBZWbD6QE/s9yKYQx/SR8=@vger.kernel.org
X-Gm-Message-State: AFuF++la91PHTG9FnhCmYHo0zn1/3raP+Cv1j+JQQDyZKPUa8qG6An1B
	Avhobm+EkR4HN5m0o6TKsjWWr16BhsoMZ7Ub+CWkxE595hmO2SLOFF5HVm/W2hyj
X-Gm-Gg: AYBFou0x9aeGMcRVNDYvnTVVPvaxGbEKwx+bd2wUz/qKR257FQEFU4P9wLsEbf+4Kup
	k8B1Mr8jYVu33qika7rcmEhum2VXBCP1Grdz3JYtaiBkvM3dz/wioTLf8233lqmQS24bK0KP1ET
	CHeqahfEOpip/AFDRr01ITPfNsaYpQ8FRVXwO8a/9c64JP10YpWekollC7E/DAOuH+hSicJSS2+
	i4++zn/00QmesSgj2SlwgBzfol82JRFgnKa85lL5NlPnI0kwxHAau7sVSqTQLyrUuZa4C6hQ/77
	HYvqcbPeLdDU8sQqnam0vkANj+YayPfY+MQmGcKmZIRvwRCjjvHCOjeLCNdmCj+9nHsQWo0ovEi
	z3leyhbdceexNUKMfARgC6KzWLEDaPcE2SUND/Ng7sz+tN3DlhNTcjfJnVEjn+8rfF3PnHjOo9+
	UWMblE1Btwr73d9AA6wM1L1WQpSBOKrJpY69tdUP27wykeRnoj1W5395qT4JvTz2t/3npIDKnnA
	x5XPfryMDh4hnVDUZE16gcf/w==
X-Received: by 2002:a05:7300:b0d:b0:33b:f3ea:db21 with SMTP id 5a478bee46e88-33e7a2d8a2emr903397eec.4.1790117836248;
        Tue, 22 Sep 2026 15:57:16 -0700 (PDT)
Received: from localhost ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm1241801eec.25.2026.09.22.15.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 15:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 22:57:14 +0000
Message-Id: <DLM7T8138Q0Q.HNNP2M4NLPDL@gmail.com>
Cc: <dsahern@kernel.org>, <idosch@nvidia.com>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <rdunlap@infradead.org>, <netdev@vger.kernel.org>,
 <aajith@arista.com>, <roopa@nvidia.com>, <jhpark1013@gmail.com>,
 <corbet@lwn.net>, <skhan@linuxfoundation.org>, <shuah@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/2] ipv6: update NUD_FAILED neighbors from
 NA messages
From: "Lawrence Lee" <lfqlee314@gmail.com>
To: <netdev-bot+sashiko@kernel.org>
X-Mailer: aerc 0.17.0
References: <e5b7a4f8cbd7c436b463b3751bf283ce861fcfaa.1789734885.git.lfqlee314@gmail.com> <179011667864.2160803.5487538537038042784@kernel.org>
In-Reply-To: <179011667864.2160803.5487538537038042784@kernel.org>

On Tue Sep 22, 2026 at 10:37 PM UTC,  wrote:
> [Severity: Low]
> This isn't a bug, but a note on test coverage for the new FAILED branch i=
n
> ndisc_recv_na().
>
> At the time this patch is applied on its own, the in-tree selftests only
> walk the "absent entry" rows of the matrix: the matrix comment in
> tools/testing/selftests/net/ndisc_unsolicited_na_test.sh and verify_ndisc=
()
> start from an empty neighbor cache, and arp_ndisc_untracked_subnets.sh do=
es
> the same for the accept=3D2 subnet rule. That leaves the new
>
> 	if (!neigh || (READ_ONCE(neigh->nud_state) & NUD_FAILED)) {
>
> path, and the FAILED rows now documented for accept_untracked_na, without=
 a
> test.
>
> This is addressed later in the same series by "selftests: net: test
> untracked NA recovery of FAILED neighbors", which extends the matrix
> comment in ndisc_unsolicited_na_test.sh with the six "failed" rows, adds
> initial_state/same_subnet parameters to verify_ndisc() and
> test_unsolicited_na_common() that seed the entry with
>
> 	ip neigh replace ${HOST_ADDR} dev ${ROUTER_INTF} nud failed extern_learn
>
> and then adds cases for accept=3D1, accept=3D0, forwarding=3D0, drop=3D1 =
and both
> in-prefix and out-of-prefix accept=3D2, checking that the lladdr is learn=
ed
> for the STALE rows and absent for the rows that must stay FAILED. So the
> gap exists only for this commit in isolation, not for the final state of
> the series.
>
> Would it be worth mentioning the follow-up selftest patch in this commit
> message so the coverage relationship is visible when this commit is read
> alone?

The cover letter already mentions that tests are added in a separate=20
patch in this series. I'm not aware of any precedent or convention to=20
mention follow-up selftest patches in commit messages for earlier=20
patches in the series.=20
