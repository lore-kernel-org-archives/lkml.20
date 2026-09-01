Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E173B4407
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788267314; cv=none; b=CimT882HUWznXMBHOoQ0lVhYa2IfN+EC2zi2qBaMNDqFzQKCOmEHukOta778yWqIZW045sZ5gXZv+d7wd6ao2XzCld+dNwNSRyd6aK6BfckilNlRosMbnLrWFirfAlbvID3mUOj+jFIBENTIExzgvqWM2c8NVD5udRhFncS3Ig0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788267314; c=relaxed/simple;
	bh=8UCRzH4KCAdl6OQ7BMwwY1GtkOe+wx8YnWAPwgjE5dc=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h+LiEL1DCiTK6jbsMkDBs9LsAXrimdOKOLneOXipS/KeMzcTeYtRCJ6hgYw7F9oytfeVM1ep3a1pzwTiQtdE8xCoesiRh5nkKaQMMDq9yX4LUXTLCCgdD8TZWfR+8jfg9hIzZSK2tn74Ul25vLhEu9ca84cdThOY5dGbn3TEzpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=o+ZEaBaQ; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="o+ZEaBaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788267302; x=1788526502;
	bh=8UCRzH4KCAdl6OQ7BMwwY1GtkOe+wx8YnWAPwgjE5dc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=o+ZEaBaQAEUn3RtLNdNcH7SkmqaFsSJz/OOuwFmstLr3HcaxUCb7sLxapl7iIB+fV
	 UlHOZfWwKWWEGxq8dKqaQ8T2Q0m0YU+CdOEr6ywnjWbzsgbpyyFEk3gxx9fEDRc20d
	 q8Zbdf8HDGclGKEMBA+rsA3SNEfuXQa/kyT5KunBvuE/O9MrSC4N+izFl82yTgg44Z
	 PuureXUfB2c8ip/SNtL1rh7TEodW3WXwdBjL8ImTYzfeL6itsrGuZhPlSc/FDIp8ws
	 9EA770rVFPfNA4D2+tme4QiqczjRjPnDKjb7u6ZHCPKcndybJqqWityQnBIYsFR8eR
	 WoOyiXVP4z9Iw==
Date: Tue, 01 Sep 2026 12:54:56 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Linus Torvalds Announces First Linux Kernel 7.3 Release Candidate
Message-ID: <nRdh6c6U0spAn_jhRccnT8x631EwIPWjWbFcjvkBRZkk0VaO4q2hE9SeGZflH3MjyRUT7UG34FmzdQLgLScWNPNKfWGJNkyts585eLZjczE=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: bf0032b8b5514fa78d01d37ddc8cbd5c296757d6
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Linus Torvalds Announces First Linux Kernel 7.3 Release Candidate

Good day from Singapore,

Here is an article which I would like to share.

Article: Linus Torvalds Announces First Linux Kernel 7.3 Release Candidate
Link: https://9to5linux.com/linus-torvalds-announces-first-linux-kernel-7-3=
-release-candidate
Date of article: 30 Aug 2026

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
1st September 2026 Tuesday 8.54 pm Singapore Time





