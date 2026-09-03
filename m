Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E88377ABE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420221; cv=none; b=VtXFJbViRG0wR1sn1EoMDquM8NiPxTVBI2i/8B4Mstcg+koPTf1RlZJeEtuzentBytC0ji8v5ZIloRcgnJMGD+rUCLD5ZKWxWe4qI/0Ls9x8N+ThoQ6Uq8ZS2wu5isNT00Ku3AuFHf3KN9X9WnqN80/d4IgIoAPuXbz30VZQITg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420221; c=relaxed/simple;
	bh=vnbVkoOcbefgp+15fuMQPwRA+aFJf/0W7Hi+WC9v8go=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kDEkWMCzOZiixnCwOuOvycK5TC8jnO52djoxPP2lqVznRTcFVh6TsSZUmPt8+UT7OghVDtHuQdZSDrv33zCv+PoE6m+vfb8uKX56JvtVqQAZr7yjijC8Wx6QVSXbmer90mphQqDdnlpbJxPY/1+K0UwKB9DUIODuPfjGedBgmAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=VRAzHSDB; arc=none smtp.client-ip=79.135.106.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="VRAzHSDB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1788420211; x=1788679411;
	bh=vnbVkoOcbefgp+15fuMQPwRA+aFJf/0W7Hi+WC9v8go=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=VRAzHSDBjQqiJTM80CE9RMSXZVlMEyQJWagf9MZ18YSGV3h22nGIEdVYGt4JUX8pj
	 yDjXDr5fh+qkjGbz66pESqdKBKwr1dFQCGAXUB18Ewyr4p4pQVjjzdq8aJnH4J0QFr
	 k/KxV3bg9Zv9gdEvDTKYpAouAtncBCCYIevguOB8hDave5wwZ0fCURwSwqs90GqNzn
	 wBJmYE+9xX+MBwMn0qfCA57cH0xXp+isscGDy0qB0PjYcYF2Ba+fC+byQ0J/j5TIrG
	 cAjhgbGanblWzURi9x2tjHfh9K0k+LA8bH46so0G4HV42IlwRZRII9U/tde1WtqaKu
	 r93oEouLzDjLw==
Date: Thu, 03 Sep 2026 07:23:26 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Why governments worldwide are abandoning Windows for homegrown Linux alternatives
Message-ID: <X26e0orv6bpCf0luyQhsfKwJ8QDQ6xaTDtfMHFRVzDAEOpcjqZ-YRH289AlUsDwT5ntEgbJU3fR6wRSEc2hQxUHU5coBa0cKsRp8aP-r0oc=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 1acdfffb5c353feb21387bf10cb1d52ab37076aa
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Why governments worldwide are abandoning Windows for homegrown Lin=
ux alternatives

Good day from Singapore,

Here is an article which I would like to share.

Article: Why governments worldwide are abandoning Windows for homegrown Lin=
ux alternatives
Link: https://www.howtogeek.com/why-governments-worldwide-are-abandoning-wi=
ndows-for-homegrown-linux-alternatives/
Date of article: 31 Aug 2026

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
3rd September 2026 Thursday 3.23 pm Singapore Time






