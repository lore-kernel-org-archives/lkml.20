Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A6F49B1E7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356423; cv=pass; b=RNF6PCeFO5sM/ccZ1tqAxloD7C0Y7fFk61IPxJWzI8d06A2n1bDroBHnj647QwiGINVcbrNAzuGVqxvRmaqpbZ0yGYCrPSyTztMrpOTPDQKxXR5zLciIKMzXzRmvngpNKMuj8ramRiT6SfNNIjIlPTfOJbEt9oDCWV0C/nAMC7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356423; c=relaxed/simple;
	bh=t00JTA5JI17KHSj4FG9gzzx0ktA1h2Ge/6wt8hj4nsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4GItXWS9m+xcwFUf+aKSGF8BXk4lvN/CaiJO67GP/B9SKitl/g59CRnYt9zsud1pTjChk2/aInTifpXa882zO+tn5UmV2tbqx2yf5N+2lYEdAAHVXHnCPPsPyMbjaoT841vHHV7V2oPY8RJhuvk5r7kqLUvpiLhMIbWoVTcecI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHb8yMFo; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHb8yMFo"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so9184195ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788356420; cv=none;
        d=google.com; s=arc-20260327;
        b=AI58IaEzvgrc9YIMS1z5OfYHtFLQRhT19Tz+sSUzpQuWpt14pj9n8TkKBjUGhgJllF
         9iMuwyiMrxYeMxUlhqOrFPDjNRlu6Uf60MqNoJvDN61wZhPtoAp6BitsFiNSzM8+JjhG
         xtjZJl/cAeCmG//dHcw2s539ESD9zwnd+AMKTbbk+LCsmgAWaqOswMq4+SJ7sPYgeTv4
         VZHrlfk5hWrliBVwlkkDwHGt/iS4cH5qhsO+qI6sbE3wCBdvBqsa8R2khNFLQxvyLzFg
         K9R99jfuVvsMVcozVzDYw6/1wCdpw8JuNEv/x9H6X8hx/CjZdr7mIj0DRM6kGXwpTrzz
         5q7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t00JTA5JI17KHSj4FG9gzzx0ktA1h2Ge/6wt8hj4nsM=;
        fh=5QZyOzE63ZW1YNTcwfpnFq59aEyykfjrv0ZlN/pBgYI=;
        b=TmbHmMNJQ733JX8lwKEvROWHLMTyTbsKiyTuV2315MPWy2WbU8pTUdEE9gLSTqbmJp
         T65VCBTRH4bUNi+It03RWu6qsWvPUpYSwT4ul0mzGJhFKn3w5rVvfQ87wTdfanrcfqpi
         69WGHI0iXoY4+en9xAwZd15+NrApBtEa2dYNs0xqD9uoFM8N5z/UG//DfOsJhcbpgdTj
         7foN2Ej0FItty59f+JsizyntMUnbokcJvgntGBmPmn+K1SYfYNJXXHXrjpbRsyVbvnZf
         Zoll6h1abt0M56Yo08mxJOm+1ttyIJ2o/hLrNWo26I6nLavJMwMdv9hsHL+T1N659PBn
         w16A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788356420; x=1788961220; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t00JTA5JI17KHSj4FG9gzzx0ktA1h2Ge/6wt8hj4nsM=;
        b=NHb8yMFoBqqCwpylVvR55G8aD0dbxTFv539qhxaCQPx5IiDblhOEJyqJfK1EclGx1H
         +KYw9GDrodDkOPUI3tS/7Siw3mv1tulmmlw129cL9sFTAKsplB5rpqa/h3/WbMBNhlnd
         fHRHIQrN7TepLeufFHgr96mmQ3VEtQsQLq+Y/HsojjA6dK5oKqjlHk3UYYOcNpyFJKf9
         Xa5o0EAuAzxRM1Go8fpAworzQLP5APLJSN0HVM7iWi1sdGYC9eY4qJh/jiNhA6GwjNJS
         cHlrd1uogj0MrFg1atTF7yV12PpkcMdrI/ilI3nR/Snd9zhzannUNfZpVxAzoARhFXzb
         mPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356420; x=1788961220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t00JTA5JI17KHSj4FG9gzzx0ktA1h2Ge/6wt8hj4nsM=;
        b=Y16qwmpLuChxv19TRcaLUQjXqfdPupMESqV4vGa03jQWCQy4zKJLihoodVjeAChzfd
         9xHcGq4sRwxdY9z6lcxubKFS1beEc8oj6uMrUPiESlQu+98C8EOpq5z2Sl26e3Qn6gwL
         cV+zRBiVQobr6+5Erb0L1EsQNaVabnPkNZOte2ZoAlvBby4lj3s0yG7wSXOadWUWHI/M
         GpNtBlMOVmaDFkOVQqRGVFP+d5Ss+0VtrGoyliYY93cr4fFa36lMSe6U1vS0HyXYQMQE
         1ZaYXsY64DWENIen/unQmCAFSeEzI/aGbUw0qkBA239qAnjoDHvZwjerR62H27/JA6D6
         4tyg==
X-Forwarded-Encrypted: i=1; AKwUvBwpSv3mDx6et4tQjs0xycb18ss4wX+g6/+cSviIax8YUS/Zzcd55DHyctElOuRaWbPY179TDfNffxGKaD8=@vger.kernel.org
X-Gm-Message-State: AFuF++myYzj62LvfrX2CdwvAbKXpIOl3vi0P3iSSBWhBWcJ47sVmWApF
	ieazmbDYIBsDdcrDVr2EKZl3TVgcAE7ztRGq56rScbEdHK7fo6a8SKi/hJMMEbVJYD6BaipC02w
	r3p3Smz6qgDxQCj3GD/ojJ2GJMqfQ5hs=
X-Gm-Gg: AYBFou21ci0avgCkxzwi1x0N5MWsgnKUaC93UgUpXcqj7i+KC6ZbA7FiUc1Y/DVtKx9
	N2bdN/2pkd0iaTUVbs0KJZO59juHOFZjLW1ucn4HasAiYAg5k30/ZCWWI5nvMxvjiU2GI6HwOw5
	UJebTxzEMs4m86uGqr4Zo9NyDWyZKuh+tOtsN7uzXFRRW6SWlltqF2gnzFtXHlx55jOTltsYJ2X
	hrVu4hkpSIbwa9auBlHRHAPe5QORgFt3OHXaB1G3qVmdB8zDRYodq+i8rBmKLXglGdkR7mPB9A/
	eBJ2lmTUPKG8955bmfzxTqyjYFjffh2O+8SBELAEXL/fp7st5X02jWMsCSTOjh8TO3X2+Suh3Ck
	u
X-Received: by 2002:a17:903:3810:b0:2c6:90ec:f601 with SMTP id
 d9443c01a7336-2daec5e6457mr50995905ad.8.1788356420282; Wed, 02 Sep 2026
 06:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624073921.11037-1-harshal24.chavan@gmail.com>
 <20260624124019.4521-1-harshal24.chavan@gmail.com> <87fr2auzq3.fsf@mailhost.krisman.be>
 <CADCAkb6wuR7vT3chfFtBL0qma+gx-2mJM7v+JJLS00W3oyb5dg@mail.gmail.com> <CADCAkb63_kAa0b09GAQApBqi9-oUR03beQajkSMKL6Q4bkpWWg@mail.gmail.com>
In-Reply-To: <CADCAkb63_kAa0b09GAQApBqi9-oUR03beQajkSMKL6Q4bkpWWg@mail.gmail.com>
From: Harshal Chavan <harshal24.chavan@gmail.com>
Date: Wed, 2 Sep 2026 19:10:07 +0530
X-Gm-Features: AcwNN1VUjqEwRgnK6GyRmJMkrEFmdiPSGjgCIvG4yM_VLNIiC17js23pm59iOGU
Message-ID: <CADCAkb6s_M--WheFHQny=iGWx9WKpk9bpsjkxaHMszxUCPtR9A@mail.gmail.com>
Subject: Re: [PATCH v6] io_uring/register: add IORING_REGISTER_CLONE_FILES opcode
To: Gabriel Krisman Bertazi <krisman@suse.de>, axboe@kernel.dk
Cc: gregkh@linuxfoundation.org, gustavoars@kernel.org, 
	io-uring@vger.kernel.org, kees@kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

Just a gentle ping
As a quick refresher: Gabriel reviewed the recent changes.
We are just waiting for your high-level thoughts regarding the overall approach.

Thanks,
Harshal
