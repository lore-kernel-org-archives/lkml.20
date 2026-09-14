Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B3E47ACCA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399387; cv=none; b=A8hrjLZ8o0au6gUEbukH/5+1qPMshQ3mMtrBgilbCAHpzXD9H5XV3dFx+qFHndrp5ZQvjQlU33PCu40J8tqOiS4gz9uPgtI6r11KCqvp2JpqNHJ4V+RHsUW3mQOkvOEdJoTRPdUtcZHvN1rWlU/13hvf5U1OJ/IohWMNcqgzsHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399387; c=relaxed/simple;
	bh=hDL8dOYdLz2GIKTnYegmCM/3AuOtsWUhGCZDLmKDCIs=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iki6YUxOMzLKl0sHNuIWfATbOyVqy0oBaerHUPQgeB35xv199YT1n2+9CUFscatk6I0eLLVRhJK+PKBjTi+fF1OTviuwBVN4VgqKXOKwEGAeUWnpbUJQlpUVi9hPaCrSKU3Uk19W8oFx3Els6V2ny4N9+YI17tUUbI4seAocs4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ox5N5HLd; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ox5N5HLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789399382; x=1789658582;
	bh=hDL8dOYdLz2GIKTnYegmCM/3AuOtsWUhGCZDLmKDCIs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ox5N5HLdmBpMFVVs/iXjSYaet9bDyXna1tgoo35MVeNsGzVDEwtR0afY1nHLmDLWt
	 8n1/g3rycx20zteghHp37zl2H3fTzf2Wi4mqgjtWRtwnxegEkkWhH9kGHBx/ezqQtF
	 OdcrFyrDNZ6FedDQLHi8ZtHmK647iM+7q/0BeRBaoT+OljLzRD0y+7uCRylRXxyh3A
	 1JVCYVEtSU1z8NrY3KybesDMNxO8+FE0SyxuHFGZA/wZXi4gtd259LjhMSZkBYLoqK
	 ZF5D0vRkzkkDdEanuHQ5S1vaHLpJpHwhfbE4Zm0lPfZ2Exg8CveKTm32fQmJ2/AaPA
	 ijbIYYeyF5nhw==
Date: Mon, 14 Sep 2026 15:22:56 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Every single one of the top 500 supercomputers runs Linux, and 90% of public-facing cloud services run Linux
Message-ID: <NHBMc7XscqeumAfLWVNQsw5ZUdZFys5jD-7uh0zxBY37d4AlvrwTAbKzZAIKRxvkV-IDKH4JDoSq6ovv7nYGtGaa9Sfu-NfnitUR3aLfJTE=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: a17d2f88a0a35ee82e4b675126d40290ad1ca58d
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Every single one of the top 500 supercomputers runs Linux, and 90%=
 of public-facing cloud services run Linux

Good day from Singapore,

Here is an article which I would like to share.

Article: Linux was called 'obsolete' in 1992, and now it powers servers aro=
und the world
Link: https://www.xda-developers.com/linux-was-called-obsolete-in-1992-and-=
now-it-powers-servers-around-the-world/
Date of article: 13 Sep 2026

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
14 Sep 2026 Monday 11.22 pm Singapore Time





