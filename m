Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793292267;
	b=b0Q4Npmq7zc5uySWL6720VjdoZj3djLmUrJEEf7OQKN+YVu924ospNNtBVVwsJDkDFdr
	 qAUOt/1g3zMmWXdnX+QTavumiPIizG3bGYzv1jPCGu7g4sO9n9LcWK6hj4EtC6QE1tst1
	 ajscKahKxH5Y7pBos7g9V9gv+Kfh5vaW34bs52L9w8qNlSMxd1/pEU6T6231KGowiyTtQ
	 bIAh4ir1I311eEBkl64mi0/qAjQxL/nY+CilyGuIm89DTA3/80CR5yZyPlcZJTzF5eJJH
	 WEoV9+/4iOLLG4DRc2WS7mNT7RUzkaxD66bq72T3UncfuctQB5Ol4i+2fj5x5MVwUhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=b3+y3Zx9Shf/DUAvT1EB/38PRALBhEtVxrkr32O/5Hw=;
	b=BHRcaCTT6fG4zA+nqsXcGxkhtAVqqRhh4pBm1h83rGjMin1fOv55dR7GuVxoDUBmPdBq
	 FOArCDH3a92tECJVtJ8mwUI7zDco10Da+f7iOWdYWMb1jIRBEubDHUAOY4Uxn4CpoWQ7Q
	 gFmO39bNBx3Mg3smiC5DXKOwJsQpXLXqD0M9Rf7SY2Q22k+8wqs03MdQ/+0vcEFHDdrY2
	 jKNKtkLptfM/T/z7X17c+wjf0j2ESBXFHHcTTyO+ukyXs91X6YKA7PG67olk4kh+dbRUv
	 t46hAvziPG460eFeu+BawqZNtJHzyPrRb4EbMB8YNQ//Abs4lOZF0SQQEGPKR1dDang==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.64
Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD58606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DD58606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-44cdbcd53b8so321624fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:44:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793292261; cv=none;
        d=google.com; s=arc-20260327;
        b=G9F39HS63A33Gk4Qg1t9g3zhKeqHTnyqOS6vND/pdL8csqJNX46Rff8cGzg4yMbFaf
         nERxt9TKyJ38QwR/aqoKUkpi48+5Lsu85aSVw2Prdych9Rrl4DvsLryyujVc0r9kUS51
         Ak4+4sqBUABH6FA9WtdfrI19HAxyXuCQj/IS3nHZBhmDaxyfcOEMSLnl3izNYbQeHPzK
         UMPoWDzpdSddmqPOIkBl8HCnGRFLgTx7jHpWlGxggYgiZxxzXbuWK/3ApmKiG67sj7Sj
         B438HTQSMb5Yp3IaLU4SZ9KD9iqOyq044wAVDgMlOOgSpcF7MEn5Lv4xXaGeUgOqmHJZ
         HdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b3+y3Zx9Shf/DUAvT1EB/38PRALBhEtVxrkr32O/5Hw=;
        fh=Y8MtGNC5AJ6VwAIiR8QJH+tdb8azWbzF6DtefHXTtuY=;
        b=rIKRTmsEPW7QYmHp1wDrAmdnWxwsWwuF97TK9C4Ip/1QnZZlwYGnilK1Ddlye/LykT
         29xiE+NR5XJrUcEWD+7/l3thiDdH314a9urwlknb5g86XQVNA5RTGh7pYrE4FfygFIRw
         GOnBCckx4g+GGEQIGaAAwTMnjNUkogMxute66gWZupgVMj/3luZU4afNr/9M0GRF/j7d
         psi6UvKtfrdwObGh10wGicUdNoEvkNEZ5jBUj3mcFc+JYfXNrmtzs9Nli+2KKzQU7eze
         GBhMiZd4o1MuFOX4FiZkO67oWYR1v3yGU8LOqEg6U9VAaFLHSz0x3HF6sdSal3zREYAE
         LfFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793292261; x=1793897061; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3+y3Zx9Shf/DUAvT1EB/38PRALBhEtVxrkr32O/5Hw=;
        b=AAGCmWWE4tApKkseEkuGhwQaDIuvXKoBEP7SRmhW41ihlMKO+4bZhK+iS27ObPnPFP
         W9mn2giAl0C5EPi2aGu5+JB5AYe8vcltVgsTQRxVM8RhAe6cHkXtS0jQxbsHav63AEho
         ycRIJ2opAcbgBREJIKoYk9C84et5Zb7zTy17+mBcnIvdPOEjJoBnfS2pTf71n+qSRQ/M
         6NC7uCig4PX+yFvfQhqaCPpXxbnuvAOs+34gUd7jDS3Vkt5hORPPehD+8JwXuQ+DYHHM
         2vWWCETwhtajHRNsaYgW6iBX8S52a8p1La0IFhDg4RTyLr4Spf0kOPQ8GmAcpB6h900H
         591g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292261; x=1793897061;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b3+y3Zx9Shf/DUAvT1EB/38PRALBhEtVxrkr32O/5Hw=;
        b=p1u9Zx4un7ybGYhgdP5Wj6hlr0evzJdu4Wxplwhi6vLl0BqeYaReLS236GyU5KqAQk
         eTf3Eds6/NW8BZIpK+UYTr67NtMSyeWqxUzEG3Gyj0h6MVGxL++DalDx5o3i+ZuSKRNS
         dJyJex4LAz5fxGB/+uTaj68Fq4xvG06teoZObHWqKmq7qbfxYwyQmf3cE06850k3qgJ6
         gO44sytWMgNnzu04KlvvbPfNZ5xJTD2VQn5wRSUzLugJRLMOgOSHIU3sKVPSkCytX3/t
         +U7ey3yc9hu6zZrPhpTwF20HZfaiIJAZWPrdPVnKeqZOrJZ7jRB8V7jqP2PDECCwmDF7
         gBAA==
X-Forwarded-Encrypted: i=1; AKwUvBzoRJlBkezL57Y/r30slYbgkNxL9xL000d6f/qu9bKI4RpVgbPhIfLZWPWnYVmIqW+lTLROSuRsWToiU00=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6GOvKb6FcLMzr4iVSWesWXngmjKGwrq6wbGco92whkAfUAs/t
	5Hk3vFbqJLA3N8GNYM1qJ4hn4hPmAxfeopneuq4lmpiioV7oka5hKowxKan/bYMf7CgdFzF0sPq
	mLEwp7rOFksl5ixUi2J8tpBnYL9rzBIY=
X-Gm-Gg: AYBFou0qVS172xQJiBVa291KRn+Ttv3zfZFnpHBCw4wMDdJ61Rr1hhOg8HIpHAFj8dA
	4cEbLMDag+jfovOlMNEZawsOJ74qLSgjJdl6dJgU5lG1kRrAz2OmA/diKWmIZdu/VqUF0ABZ4KP
	Y0R0+ZVs/OXw4qFoCl5t0N/a36V3kXz2oBE4uHgAcX4JZ4cuhzliSuxfPAUP8jOpNu/ckCQEGkk
	JofjKnGHaOMzemwpsfqxh5kz+oFg9EQU2rMsSudzWMFzmF0NZC1oWvF/TrZlvIPu/pQfKapYe6l
	7ZcUqQ4KNc7mQK6Vqfa41dDUGr+mGWLTjTl2h9zsxvor9sMtkQvNPw94FQeTOBIx7IJvmOzma/3
	ca9vEI6p8TCj0hIKzmO6scavAl4NluvSE4bQfpcLN++s5GYonwAB0de7ro9EI9fxqrxpupDtW
X-Received: by 2002:a05:6808:3197:b0:4d6:90f3:74ae with SMTP id
 5614622812f47-56384197794mr4379953b6e.46.1793292261209; Thu, 29 Oct 2026
 09:44:21 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028154008.67451-1-dennylin0707@gmail.com> <CAOQ4uxgDmhddqpFawaK874cfWCp4jVDnE67eqXyDA9eumpMEpg@mail.gmail.com>
In-Reply-To: <CAOQ4uxgDmhddqpFawaK874cfWCp4jVDnE67eqXyDA9eumpMEpg@mail.gmail.com>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Thu, 29 Oct 2026 09:44:09 -0700
X-Gm-Features: AclHuK_1sASlVUtzDN1GpkTnsvtyNbxnOAThii4_r-uX-r_SWsslPNQvF3mBN50
Message-ID: <CAGEkeHdXVTQU7VS=TxPqmsXMtFFeP=LWw-y04NmcRWJrwHa8mg@mail.gmail.com>
Subject: Re: [PATCH] ovl: restrict casefold consistency checks to directories
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, andrealmeid@igalia.com, linux-unionfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> I am asking because I got some patches for overlayfs casefold which I do not
> prioritize because I do not know how widely the feature is really in use.
>
> If you are interested in reviewing or testing said patches, let me know
> and I will send them to you.

Hi Amir,

Thanks for applying the fix. Please send the casefold patches over;
I'd be happy to help test them.

Thanks,
Hungyu
