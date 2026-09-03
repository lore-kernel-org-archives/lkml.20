Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C047647042C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448388; cv=none; b=LGe04LB4r4g/qJU9f1h3rGyNKl0qmjgPeaXUTEIRNP4e026t+DMnUoDDF/yeSaQGUIZRj7G0+8O1vHLzrmsDwyPPxyEUVNxckyzgsl0Xt4wE0d8pjU4hak4RR1JVMsJX1IAqoJwzSKE+hdSNijPFT4zgNqtZX6XjFrB9ae1F5w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448388; c=relaxed/simple;
	bh=qThTJjLpt0sryJGngi+7eyqj3UrW8IsmsdoICmO1Y1A=;
	h=Date:From:To:CC:Subject:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=fGYO+fzBfDf1fMV4k+Ci9NmwDtvEEsoV9SIIWrSJb/ECdGUMPn8nG/NlBVDlByu1GczscGYP4b424DZPoQkqTqReCMHYZD5D5O2hKxncvqzKnEK3TND1urbRoPqbeuhIVOQCAn84XZX0JjPbjdul4rbD8vAvQQkrit9qp+RYnHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=rhXW7smv; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pyjCt9Os; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="rhXW7smv";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pyjCt9Os"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788448378; bh=qThTJjLpt0sryJGngi+7eyq
	j3UrW8IsmsdoICmO1Y1A=; b=rhXW7smv72K3MHJnQrR09RMnvoqcTWJHMnFizKuw2zXeMvaPP5
	tmbcQs6n4wgteaPBauCvJ0BwBfT2ROPBw5RuQ8lSZefI1/CBn385AdSmkYopQdTukS6yPvTxFEa
	Ut2VNZTT5berIurOrtWVxPXEm8p/6B1cxooIQoIBkNDiBo2qHaQxRRsU/VDWGrR5nC81nK74mJx
	WxUeyNYVeeR7TQWrMZHy3/S1jcHnGuSx8sVDzIwXH2Q017GitJRSOEyo4ZhRmRYdK0J7SqYpm63
	83Segk7h/XWoBkqxq86sfpLRMolf2A79tw1iE62X4ATAlIoBvXuQfHguDsqZMaJYM3g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788448378; bh=qThTJjLpt0sryJGngi+7eyq
	j3UrW8IsmsdoICmO1Y1A=; b=pyjCt9OscFXpSOB9C9AEfzKST5ZfKmoMemaEQBIqU+s4S+Xy6r
	6geN+YBg+HevrbKT151FBiX+xeMYWN6nh7Ag==;
Date: Thu, 03 Sep 2026 16:12:56 +0100
From: Bradley Morgan <brads@mainlining.org>
To: liushugao@xiaomi.com
CC: anna-maria@linutronix.de, daniel.lezcano@linaro.org, frederic@kernel.org,
 isaacmanjarres@google.com, lingyue@xiaomi.com, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, weipengliang@xiaomi.com, wengjinfei@xiaomi.com,
 xiongliang@xiaomi.com, zhangjiawei8@xiaomi.com, zhukaiqian@xiaomi.com
Subject: =?UTF-8?Q?Re=3A_=E5=9B=9E=E5=A4=8D=3A_=5BExternal_Ma?=
 =?UTF-8?Q?il=5D=5BPATCH=5D_tick/broa?=
 =?UTF-8?Q?dcast=3A_Plug_clockevents_replacement_race?=
In-Reply-To: <e52a3bfe9e444c14bc6281b1075c1fb2@xiaomi.com>
Message-ID: <20361A3E-0D14-4CC5-946E-D75244CB4A45@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi, I have a pixel 7, if I could be asked to backport this, then I'll be
happy to, for the fix, add:

Reviewed-by: Bradley Morgan <brads@mainlining.org>

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
