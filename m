Received: from adamchcechodzic.pl (adamchcechodzic.pl [51.254.141.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE9B373C00
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.254.141.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791759318; cv=none; b=lOwVsRjqkxx6+e0WG/hQAavLBzEIzbQfORwi/xMBS9EoX7m3+wI08cMD+tlfsFgZKANHGkRjgZ3zxuDz3KkfXiwfsWGYyJkZO/kfa/jOd2ZakK8bQBJDCNlZmQV8tBjGgberl5McQSPehDuXE/mvzCLVRMgHEXfqwpEEeA6Ds1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791759318; c=relaxed/simple;
	bh=2F4yMMwkgMXqFZKZbrFhRcPx580EwzVCLmGG2/Z+EmE=;
	h=To:Subject:Date:From:Message-ID:MIME-Version:Content-Type; b=GTjcwEG63zBrcUfydnbHzbEUzS0sc+22TNQGtbEnOTLwwhtHeKOWBUxI+Ejzj3RW74owiVBhCY2S2DUpKqqY7YYaYSVcbwkux9qTeDCWia0YgJGjIR+HnfpmA5qArlrj4a0AMeBLiV7W2m40untB7e/tXbMD/T25bzY9+pENItc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=adamchcechodzic.pl; spf=pass smtp.mailfrom=adamchcechodzic.pl; dkim=pass (1024-bit key) header.d=adamchcechodzic.pl header.i=@adamchcechodzic.pl header.b=f2pk+TIn; arc=none smtp.client-ip=51.254.141.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=adamchcechodzic.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adamchcechodzic.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=adamchcechodzic.pl header.i=@adamchcechodzic.pl header.b="f2pk+TIn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=adamchcechodzic.pl; s=mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:List-Owner:List-Subscribe:List-Unsubscribe:List-Help:Message-ID:
	Reply-To:From:Date:Subject:To:Sender:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Post:List-Archive;
	bh=ibyYUEPPyuuBjayMfWisBC6qz39qMX4b66AvHz4YBZU=; b=f2pk+TInOiFqH7tbSyx8deGpz7
	OO9Z8gZKvbIssJxlwI+T9sAJyXcXYRYZ9ycrCNXqBf1s++BpPO1b6k/4oOGydVm4dF44dXhpB0TPL
	Gh8Hq5UCdI2+PqSLXEnjaTT3ik3pt94NBRsH2f+jNvfCDOdrYrOUPG9t9BHJgRmn6G8o=;
To: linux-kernel@vger.kernel.org
Subject: przepraszam
Date: Sun, 11 Oct 2026 17:29:12 +0200
From: =?UTF-8?Q?Adam_Pop=C5=82awski?= <kontakt@adamchcechodzic.pl>
Reply-To: kontakt@adamchcechodzic.pl
Message-ID: <69eikkhECZ5Z7j6HsRXBQPE9qMFzoe6XNRqH8DM4faU@adamchcechodzic.pl>
X-phpList-version: 3.6.14
X-MessageID: 16
X-ListMember: linux-kernel@vger.kernel.org
Precedence: bulk
List-Help: =?us-ascii?Q?<https://adamchcechodzic.pl/lists/=3Fp=3Dprefer?=
 =?us-ascii?Q?ences&uid=3D43ebf2561c1228e537afd6e6e1b73196>?=
List-Unsubscribe-Post: List-Unsubscribe=One-Click
List-Owner: <mailto:kontakt@adamchcechodzic.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

 

dzien dobry

jestem Adam i mam 40 lata. Od dziecka cierpię na czterokończynowe

mózgowe porażenie dziecięce, co uniemożliwia mi normalne 

funkcjonowanie.

Mimo to, każdego dnia staram się być pogodnym i pełnym nadziei

człowiekiem, mającym wiele marzeń.Jednym z moich największych celów

jest możliwość prowadzenia normalnego życia. Niestety, choroba

postępuje, a zanikające mięśnie prowadzą do pogorszenia całego stanu

mojego organizmu. Dlatego tak ważne są dla mnie turnusy

rehabilitacyjne, dzięki którym mogę poprawić koordynację ruchową, z

którą mam największe problemy.Jednak koszty takiego turnusu to dla

mnie ogromny wydatek - jedna taka terapia kosztuje 6000 złotych. W

moim wieku trudno już uzyskać dofinansowanie, a PFROM maksymalnie

dofinansowuje tylko 1600 złotych raz na 2 lata.Dodatkowo, aby móc

poprawić swoją jakość życia i niezależność, mój cel to
Egzoszkielet

urządzenie, które umożliwia mi funkcjonalną rehabilitację, chód oraz

ćwiczenia polegające na przenoszeniu obciążenia między stronami w

niespotykany dotąd sposób. Różne tryby treningowe pozwalają na

dostosowanie urządzenia do postępów pacjenta, co przynosi liczne

korzyści, takie jak: Poprawę chodu Redukcję stanów zapalnychv Redukcję

spastyczności Zmniejszenie bólu neuropatycznego Usprawnienie krążenia

Poprawę funkcji jelit i pęcherzaCena egzoszkieletu wynosi

aż 500 000 złotych. To urządzenie pomoże mi w codziennych czynnościach

i pozwoli prowadzić bardziej samodzielne życie.Moja pasja to muzyka

elektroniczna i fotografia, ale najważniejsze jest dla mnie móc

cieszyć

się życiem takim, jakie jest. Wiem, że z Twoją pomocą moje marzenie

o normalnym życiu może się spełnić. Będę niezmiernie wdzięczny za

każdą, nawet najmniejszą kwotę, którą zdecydujesz się przekazać.

Dlatego zwracam się do Ciebie z prośbą o wsparcie finansowe na

egzoszkielet, turnus rehabilitacyjny i marzenie o normalnym życiu.

Moje skromne środki nie pozwalają mi na regularną rehabilitację i

zakup egzoszkieletu, a tylko one dają mi szansę na poprawę stanu

mojego zdrowia i realizację celów.Dziękujemy za każdą formę wsparcia.

Twój wkład ma ogromne znaczenie dla Adama i jego rodziny. Razem możemy

uczynić cud i dać Adamowi szansę na lepsze życie.

Oto, jak możesz pomóc:

fundacja avalon ul. Domaniewska 50A 02-672 Warszawa

tytuł wpłaty 825 Adam Popławski na pomoc 

nr konta 62 1600 1286 0003 0031 8642 6001

blik 666 324 328 tytul poplawski 825

SMS CHARYTATYWNY Wystarczy wysłać SMS

pod numer 75 165 w treści POMOC 825 bardzo jest ważna ta treść 

Koszt SMSa to 6,15 zł.

brutto (kwota zawiera VAT), z czego dostaje 6 zł zł

JAK PRZEKAZAĆ 1,5% PODATKU?

Wypełniając odpowiednią rubrykę w rocznym zeznaniu podatkowym PIT

1 NUMER KRS: 0000270809

2 Wnioskowana Kwota nie może przekroczyć 1,5%

3 INFORMACJE UZUPEŁNIAJĄCE : 825 Popławski Adam

4 Zaznaczyć Wyrażam zgodę

każda, nawet najmniejsza kwota będzie mile widziana i 

przyczyni się do spełnienia marzenia Adama.

Pomoc bezpośrednia prosimy o kontakt

dziekuje adam



 

