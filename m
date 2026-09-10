Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE123C1D6B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035912; cv=pass; b=GdscoD7nEYHTmPqDNjolUlE9T/22j9V2RAYnDZ7/Ski3J5Row+XtBSJUz51pdguwHTT12uLwGBKu0tdIQiUfZua/9S2tvbdjTpZV0i7jHzhREXUA8UOq9Z4VV3R8z6aIe2qpbNfp09A0zYEhWbj83ientKovJsk7ON22yHq+56o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035912; c=relaxed/simple;
	bh=nDOMwEFmq4ys9LsFhX+YbJ4h+PB/dTq06lEyj7W61bw=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIHnf8bV1gLh5z9iCTH9Wl0q64+P2AK52veRLQrzyuyfuZHuBg8GKAnOhAoMxZFYeoNUQTCPkqo9DdMQ6Xe0Uh0AUbAK9m1niT0FLG3YQYfMa5IhG1bcqUaQnB1t72LWqmzKb2dMCLGnuou9e120gTEPZ8Y6twszgSySdpbxGZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=anUyL9X4; arc=pass smtp.client-ip=74.125.230.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="anUyL9X4"
Received: by mail-qk2-f1.google.com with SMTP id af79cd13be357-9395921bc31so457531285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789035902; cv=none;
        d=google.com; s=arc-20260327;
        b=G+koOFf0irFc50fkXMmU6rBp29Kh39izcXeIuokIfXe2wUPH5Jjf4rsUhjkf9sh2zx
         PeW5RJ3EwhjKrE2DUY2aNvqHv6E2UJw3CQJlrj6+xn6O0Jwmm54nBFF/N4irSvwnzoxR
         V82vdBfb6V2wyAdUC0GJ9g3sluzuyGr3fJCCYapQLANQ33no6s4nd+MULww71oHTf4dB
         9u2gc7c0V+UQNT+g+hAzPDjkejZr1155m25CMz6JB1E21SoREMZawId6eM+u+HzfbzfS
         KdXAqSTC5dWauRebIxlTVRRjfF5Gdgrcn9fZBG1nDihcvxmFA065HU9KGimKixgMEWTK
         VkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=nDOMwEFmq4ys9LsFhX+YbJ4h+PB/dTq06lEyj7W61bw=;
        fh=OMcc3y8xTu7l1pd4BX0MI0THZ3xlrCYi+VqFphk91nc=;
        b=ZuuPc7EjC/lv+26WAWhhWsEF4kORhHZDUHNB/xeU7MBb19ijz9JhYqCOK355gRgEAw
         bSIiuJQCjnVexfaJ1Z/xj9OuvI3LRD/e2hNzb6wUH3kzOfvx1H2aJppGZSMS1tiNBvv2
         cBONb6vMQ28Vyi2Rri43e+NDqr6Hzv09D0x8RXkKERCs8ST7L8oEcgFO3bpUGQtZ6EES
         0T5mYlznwZtWLXE1ABduUu8nNuNiXyYqIUMRDfbjYmcJ1emGZsenWBldlsIQgoyrtPx3
         57kFMlMQxGW5gN7kzgJdzfAmXm6fRNq+WuWYF+5k5UI/nzSsyqx4TxJVGe9FOdJXyIEv
         FJIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789035902; x=1789640702; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDOMwEFmq4ys9LsFhX+YbJ4h+PB/dTq06lEyj7W61bw=;
        b=anUyL9X4frEDQW6T8L8oMc/S842dBiDqOopxZQptUDW8DWdrFbvj+3YNdhbzICGQ9h
         kRpTC403AQ13GBVmxhRTuKQwis145LD08UwUd2yMY12MFrJiBDnzqTSjdAmr5nU/sP5S
         P9UE60Z+vSKccn3npX7/4ppXQ63qNSEZCBQv9bIBffWdw7v9XIoYDp70YBq240PSyMeN
         K7r5NhKciFwLJucQfjqS08S4vBoRqxoGmTM3BeH1FZOYju+NGz7m95k1FYDba3e/F85G
         gIpdKzgX7lBwnHl3WOWmpDg/U6ariDrl7M5jCqJ2zFE/MkuYDjhGchQftvc+2GnnMPqQ
         V3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035902; x=1789640702;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nDOMwEFmq4ys9LsFhX+YbJ4h+PB/dTq06lEyj7W61bw=;
        b=YVVOg4vqdMTB28O+93rFNeWCBKjiIC132JtipOwBdHoCM4Lez88x6j7Z+CUfLquSG7
         iUMkX4KyQEfS4UooARTwTQi582/fPmBdhP1N9B7AZHXJIeN9r5V88mUkh5ZNV91S4exA
         X+JfmdDZ1JNWiV3PO0d+FshF5D6CxS42Dsmqqd+Bt9QTECjmJfgiGj9pN9fpby5RQ2TU
         4wsrgk1Nz7WfYAZzssFxHn40jLxvto6FCVCAPOXQX4pGOfaPoekag0cZ0yP4Drr+33X7
         vxTD6xzk+1w64urlfqj8vzxh8VJZf531exTJZ4UkXNwlvvRCeygstX52AXjJEEQM4mWM
         fu/A==
X-Forwarded-Encrypted: i=1; AKwUvByOJcBxD4AfbFgs7uupnluUFhgvM06Prm0il4H9eV69/u3N8LluN48fo4T2bcU6Oq00PZS4RmDloEBum3A=@vger.kernel.org
X-Gm-Message-State: AFuF++kOPKLiOhVWV7TOeknVvWjwmEPqfWKNhDu3vuD0Hop+joY1Rs/5
	2YUqrXgxW7RjJkdz1yl6rEp18aFQumbdPgpDqbkBqeJa4SE3LVjwloK+yPumBFONHzPjE2rFT5P
	MiEts3+X1OYSmEyubErP1nVKXLW1WWhE=
X-Gm-Gg: AYBFou2eG3Y2Vnlc/H3z2SJJ/ugphhKlQCJOnudKCM6J7q0b6JYI4UWgjHdCYgcyIEC
	11hMeJj1pptebvd7bUsIy2HuBxqyP+NCKKnW1dtjlL74LYN2N1Jq2DYMsUBz4oCtQFlU7n6TOyr
	/uPE0ur1nA1ApBKDqzgD7ffTDVMbCyAsqnfoukIVP9rb6NcBNSqkXNUTB/FkwnLByjdQNAQYuwV
	N1hf9dZQXqT13XcS3KM9ADSl78hue1G6AQDKDVz8h/mtcgqjH2y2PN4GPav4HO2kKJ3N7R/lJPR
	3CcHNrSmVy2iDdFwvpxjNHjno9QE5QzMVdyGV0+h81nwlIszTAL0tA==
X-Received: by 2002:a05:6214:c6c:b0:90e:978e:1c5 with SMTP id
 6a1803df08f44-910d0cd306dmr100407746d6.16.1789035902071; Thu, 10 Sep 2026
 03:25:02 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 10 Sep 2026 03:25:00 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 10 Sep 2026 03:25:00 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <17f49997-2bca-4e1e-8d58-bc95e25b9a23@kernel.org>
References: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
 <CACGbirSjNMD1mijDWRp4gLcw-6dJsErrF_jgjwr3nO-geBb1Sw@mail.gmail.com> <17f49997-2bca-4e1e-8d58-bc95e25b9a23@kernel.org>
Date: Thu, 10 Sep 2026 03:25:00 -0700
X-Gm-Features: AcwNN1U1KzJJqcIpSm1ihT2K_s37DAftiuJeICzH9uiCZ0P912OBUId5Syhekfg
Message-ID: <CACGbirSm=AZtAVwJAZRZt0JAGGUGVOCUQVqu-EcEiiGC-=+vJA@mail.gmail.com>
Subject: Re: [PATCH RESEND v3 1/2] selftests/mm: Reject invalid test
 selections before running tests
To: David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi David,

> How did you send out the previous revision? Through b4 or git send-mail?

The v3 sent from hi@tychen.cc on September 8 used git send-email via
SpaceMail SMTP. The inline Gmail resend on September 9 used Codex's
Gmail connector. The patches were generated with git format-patch.

The Gmail Sent copy was intact, but the copy received outside Gmail
had wrapped diff headers and altered whitespace. The attachments were
a workaround for that sending path. I agree they are inconvenient for
review.

Thanks,
Tianyi
