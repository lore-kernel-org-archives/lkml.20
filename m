Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEBF49504A
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 12:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463359; cv=none; b=i7zzNOLaO/LurRe6qhFE7k1Yf+Lk5BMnp9IzZW9ye9XMt51AHhXTLn8GZLqjehcrvN3bSzUtXp56uMCBaJ4RT9o6i0Py20XE6boRGyMp0NfnaDvYGrVrQNNu2GfYD9EN53uZnm3OPj5UQ5yCC0nlh9PKCLgRTQmTM2iRWaRBIZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463359; c=relaxed/simple;
	bh=M2aFLYqloUfwwoShMttWjRxEus8bFpakdomTjQhYs+0=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I94Bn6+vVvhBvPUhWL2jQpwT2GlIduPmBMlz9klJAVsEcqldpX0A56plHNDBXu7cbD9HsMGtrFEwud/jovc6fwUTwC5CJbUV66Ph+U/r9yYRteevESA66W6BNLwe1W1smPnIp/eklhlnnplmxhK988wVXK2+6wTdGjJtJExgDeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=rAqoglOA; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="rAqoglOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1791463349; x=1791722549;
	bh=M2aFLYqloUfwwoShMttWjRxEus8bFpakdomTjQhYs+0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rAqoglOA5yPd1zqizCCleom7c+7VWn7XUy3q+OmakrSura6oOYm4EJck0u5txby2x
	 7uOvrqfHuyPKKCW2iETRKKPq380r6G1/muZuH9lBKvyZqUwqHoPrKMVReMlEj08yL5
	 uj/zotzhYfrxMfGz4tBxlImcsZHl+VxwQCJZtKm82S0v9Z2nkFtY1xPKd2zkGWaUTn
	 FFQXYeiReZ1NH9GR3k9xRzsRhNBOO21/SIxieqIHpXAyhkU9cL9wEDijvBglkb9uMb
	 1LxRz6z2V1Q7R79XnUZCHbqv4EQDfHW/h45d7gwE7C3SQnJrTYvhku5CAgUHG4PykU
	 phFDjZnbDeeNQ==
Date: Thu, 08 Oct 2026 12:42:25 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: =?utf-8?Q?New_Linux_tech_compresses_memory_in_RAM,_as_RAM,_for_452x_speedup_=E2=80=94_new_CRAM_method_offers_giant_boost_to_compressed_memory_reads?=
Message-ID: <Pb2gfcFKJBKwWOQb0xyS6u2pr0cKZfVl3VpYePkfAcXz16jxtVL-xvy5K8PqlIoFh5QMOFD2WRfAHIqcB3VxCP2Sd4Md_hOwjZwlNRz8Xpk=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: bc67df6e95678f739b102d56ef156fb8a40081b1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: New Linux tech compresses memory in RAM, as RAM, for 452x speedup =
=E2=80=94 new CRAM method offers giant boost to compressed memory reads

Good day from Singapore,

Here is an article which I would like to share.

Article: New Linux tech compresses memory in RAM, as RAM, for 452x speedup =
=E2=80=94 new CRAM method offers giant boost to compressed memory reads
Link: https://www.tomshardware.com/software/linux/new-linux-tech-compresses=
-memory-in-ram-as-ram-for-452x-speedup-new-cram-method-offers-giant-boost-t=
o-compressed-memory-reads

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
8 Oct 2026 Thursday 8.42 PM Singapore Time



