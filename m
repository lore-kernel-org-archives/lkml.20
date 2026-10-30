Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793322163;
	b=jNe2VRhMutUpJMWH+vtQ8jdNNJFZJboLDk4KE+q+FFLieFd/AEhqy02vYVuL9MbrDJ1q
	 VW6NtGpoaWIotttX660j0axao13Qg02kmlm8lbGdQ8gftbUejon90YjtvSEeyKivm6nja
	 lgoJNAl6yFeodjav5Nli0BCPw4OJWCUHs+9o5qDce4HARi0J+axEqt4vJnOohnK1n8+6b
	 wQpHnlqVfIxVyEwyK8sPHROF12a3342Z1lYSqzhs3TQHR7tKl6xUEy5NmZM+svutxPXxL
	 RWmh2Za2sz0ok4dWkqY57nPPx11BpuZ+PeaF1qU9aRJ9lYoVjUZFVbwv611Qn17h+og==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=SZvmD0cJyfgbDaWm1GDvW29zuwyZyXicGYmT+t5443A=;
	b=JurLXBYxg2A342I2h9qV5Pjw0AyEpZV2UXtilRTglF6rt+nKN5o82JbK4WZ+g7+VPlCq
	 XrcAoE709A1EYPviipTNUqPyjPF9HuMNZWHcPEnsci5h+24X+NHZFpuE+TRSJVSVDWPyL
	 oI9FmFC0krVS/c8tgHcAyJ1nwI5Uwmi7gPc5oELtkgJgRpHhg8O5dDgnf/y9ErcRWE4QM
	 2ThardoJWyYvqlKEG6NVJd6rDG/v4FCLJ1TL0Nrv7gL4GaiolgF78IyZBHbcqWByTvZnG
	 /TuZ2wB8ELf5+AQytyHB8yV8roL2JXxBSmb3zrZTdscC1G/QZZUZ4XPEXReBHSSctBA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C3vT/wK1";
	arc=fail smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08656606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08656606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3vT/wK1
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91c11468b5fso2183686d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:02:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793322162; cv=none;
        d=google.com; s=arc-20260327;
        b=ITfE2d4rQbnjyHzqDp/DWRCNF3j0KQ2OQ8oMWJGbFsFOW4SnUufbAWMJh0oNzHmSfL
         UDaeTF4b3fMVREAJNs2JgHY9LqMMc0V4y4OZLk0u3IVdIiljxD7YJTHSk0POctU3CQGR
         U01JVb74nSYB7eCIfEPUORU2T+pn4OA+ANZfRg1LUHOMNSygmeadsbKLhKkySLUEPK1o
         QmPfG0iGVdcEC6bMlcU/4wPKmOwvE8N+aepvoGD3yX/rYuwytQJRThqtJLPrUc5Oh7O3
         MC0iSDfhX1qUT3J6LTTaNIL9WpkOWxx23q82tUVB8Sa6DvpYeEeM0oOyMb0Cn8acwoSR
         2xaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SZvmD0cJyfgbDaWm1GDvW29zuwyZyXicGYmT+t5443A=;
        fh=HS3PoZaexg+t4KrCVSc6VatL8pDS0krPPnRi1Prhb60=;
        b=J26BJtbcaRJ2ZVQ9pkHqKaj6DvMFPiSYDWplR0p3RqJet/inXNK6aPpks+u6ckd8va
         Q8qPMapOiMGDm36IN1VsKEvzT7WSHgZVNRsYWDy6XcNVkNrCp3FO40N9BrpKbOOJubi4
         X8/QpidTZPcFyj2yo6kLZ8xvCiPfh5Eu2NRIaK4ZWKpzGYhqLJ8ppGjj74LEg5qt17bI
         FyJSR8t0mkQzt2tPZZy5UvMovocgBItifONCU1Vz4yvoPPoNt9Qi+PfECf/Hna31OBC4
         /56UwTwDI2T1mp57/enNNQsN+vadU98JPtxzqsqs3k0fPznArCeNZNHU9TTX8Nc7KqRJ
         UmXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793322162; x=1793926962; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SZvmD0cJyfgbDaWm1GDvW29zuwyZyXicGYmT+t5443A=;
        b=C3vT/wK1BPu8PPcF5kTaY8t1PR5lITtEja12EZpSrMn4ii201Xn6Jsa6rG9tyaCco2
         S7VuTWBhvzRWPltnhSWolorueUAWljvs33BbqB5IC2kWaIV4ym07QNLaTuQG2NuoNcHu
         bqi2ZEnXcOIMhbq6jnKVcFq7K42AqzOJ7Zrz9txJiZDx1Cdit1OYTsWopNkYDfUEidFB
         Ox3mMErQ1xXS0xpvtLhPnz2qOfapwCUawautzoLQnfypMUHbxi24n9mwJhx9Y/Eb+zlA
         mYlLGalbLrIdYQ8y/msECJ4wfX4Esb2djfWbqBFo9g8eeiq3sbD4EIyqpx5ReRilnIDd
         Cosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793322162; x=1793926962;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SZvmD0cJyfgbDaWm1GDvW29zuwyZyXicGYmT+t5443A=;
        b=ZRwweXV4q6WdlJJtOgHxbo/BzxT828T2BnzO1AOi6p6kH2nBuNCB8vwviy2XbTlY1A
         T2o570FDch2getseJyzONoVZexPNnukfofTxUUj+9WFEdk65gar801RPvsQ+OJxAhz1b
         QQqYBI2bt1VfWcex5hpl+z7NkabwJvfhjcz8OMH2AV3JSa1rd+7Q/3pIbWsD6tWOufhK
         y02ZanjU+0D+f0nJoQ0mO2id/D9Mj8z9P9NCg7uxOL/pYFYfgYNSD/ktgiB+tuVE4p3g
         Pq78A0dpov0ynjHIiPwPVQ3qsU+QAIgP5ea9NeUjIYESzRkdhHCOTMxBJyhwTx0POtrQ
         7RaA==
X-Forwarded-Encrypted: i=1; AKwUvBxKkp7ixa/gVsOMYN0zSUNf2z7tQFtE5Xet0/28qDiweJsbZBRVRiImO0diHeCqv3RLDPMYMgt1GJHw+9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKI7j0TJIvBOmok/qodXUwoSwvJBvNBNWyU+FWqd2yNRBnZH6md
	Td9T8doQ4YwFSiiidhlDrI9y9Gd491HWlBiTnNEqkFbo2wtxthJpcWhc72dYrXkYXByYPoFcxOM
	SNf2Kf7JfeISCkMxqj/kWkcr4upfIAXw=
X-Gm-Gg: AYBFou3DQJgv958q965bLYQIpBYr3EhHckoTdodHoREXGh034Et7/Rh2lWy8fFlr26a
	k3ON8lCYntk9O3INn0jLpdiYbeZt7/NOaZOO+qvb2/0F9aooZF6mHG1NAmYE2QfXSgFK3B8AYaX
	9fU2B947zoO9qvD6qjchJeAMpJUQA3qBr+h8AI8af0MnywYkb2WSzU5SvbTA4Sy9VXIzkhqHSC9
	5ehr2GB0n++6vzRWKRMnQ8IMqKJp/ohX4vhZNmwS3XPUe2VAu8BGtQfg8vqxmN0RhQLB/gyggs7
	T9NxQZa/xuZoAIgKszTDzepaptDrpuOUZEN/DoNObZTet7H1wJROVlIPnST4VNMTxVbm8yGTNuD
	egFcCT87hUoz470vA5v4TuzBbnRg9pjtZ5V13APbsPUa1SBcs18u7xHckDnPIlhPfxwvUBKOftd
	sxJ9fzq8K81WlnI5aXoQYXHO1CggMT/V6JU3NsH85vVL+6QiZdN9j8MuJ7/jd+VHYmOckMjjeGB
	6+M0Q0ghy1p+QuQySKhCd6sXt6XmeTnKRCvFTlnlQ6pEqAN
X-Received: by 2002:ad4:5ca6:0:b0:915:e5c8:5663 with SMTP id
 6a1803df08f44-91ca4a0cfa7mr11886956d6.4.1793322161725; Thu, 29 Oct 2026
 18:02:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 29 Oct 2026 22:02:29 -0300
X-Gm-Features: AclHuK9pTotqg-4NXfN0QGNmi4zl63SrTrsIxEaA1R26_yNKaDtcg8Q4fwZl0Kw
Message-ID: <CAMAsx6d68k49rTNqzJwvZxq-+JZnVKGo7oovnhk_49R3JeP_tg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] Documentation/ABI: asus-wmi: document TUF keyboard
 RGB attributes
To: bartualev@gmail.com
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 02:48:52 +0300, Bartu Alev wrote:

> The kbd_rgb_mode and kbd_rgb_state attributes predate their
> documentation: they were introduced as write-only interfaces and never
> received ABI entries. The readback support now being added makes the
> omission visible, since the read format is part of the interface.
>

Reviewed, no errors as far as I can tell.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel
