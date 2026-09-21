Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885924570EE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790011485; cv=pass; b=Iq25pBb8YjP3zwmUnNxQuM2/8XOLKYBH8knzMBaund+0PwW92HciVT6Pvlhix7gOLowBp52ylelFDxEv9sDduaJ3eRT7vUDZBXyhGpvi346al/jSEIuAejMADACZ389XHIOnwiZIstQPeO9lEPXxpAjUIpfC0Y1tLQcH2K5w8Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790011485; c=relaxed/simple;
	bh=/v0KnOInrE/uxrVKcrgbiXLeViQuxHndnnvuHrKDtYE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uhIERiSQmxUkexqb3C2N/gZhoVpaxutDi9yeH5AgWudo66ELFGx4Wr67fbNvQkKrGf0Cbdw5CAOTQzcu4B1zRrHTwi9RVrgliCXChejvud8uJThRhIhGUByUy2NN/8JpX68Ue2yzUZgKM3ew87C/GCmc8CfKwTiDf84Bl6zFnaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X9Gry/EK; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X9Gry/EK"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2db33db4de9so9625ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790011484; cv=none;
        d=google.com; s=arc-20260327;
        b=G7+t5cyupLcmLxAyqTXseCuteokvep2h4eFc3hyX1SwLy6fas50uGHExnJI/HMOrUf
         UzqqPVhMswdk+Po99d0zBtpLkQqE5E4LsCf5mX6j3th3tREU8fgikBIHQP/rd+2hx1xL
         T9Hjj5CdRDUqEVpXGV8JIYAIBn+tJjEAVVtKK032SrxRBKWhPWvdOM30trySGnaEjfEh
         9C1TO9IuqUb9jRVI4XFLoYF9ZvtcgwBvgNP7YQXb4npKSNedb80lT7ZOH0lL/BGETBfL
         bazUx7cHOzdbY1cZvJGvf6JICa5EDRqZZV3Z7Mo1ND9Ls4WSgnWu8sM8ZlSsFX6QoWnn
         m/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/v0KnOInrE/uxrVKcrgbiXLeViQuxHndnnvuHrKDtYE=;
        fh=L/tkX7oSLKrOJdZjp9bEM3PV333PHEgdn2BMamhKsa0=;
        b=HbZF9Yi5dN77RBYiUbbFOVERzne0FYNjfrwk2PqjN/SJwmpIQPYg/2ZX7xC2EYIHs2
         CfndIqiGoNDikKOt41FZb8LBspGWgvEEUKSjQ+VERCSzasG8kKosmBdFwTvL7fu84Tiz
         zBh5cCvsETTGtk8IedKJbqJ7ox60GBN3Dz57e4GPcwFRUjc2yXWB7AF9bVboCLThgO+W
         KBvVyQ6SLzaJtPH8yBglkpindg3fxg2eMav//MRvAgCHQEk2+WkUb6zmrOdU0zDWqRco
         Q8cIJnIJIxBV7WPVriC706VVFm/lCIeJhLyoEDChcvS9u1s0XW+gvYJKm3hkxyeSUfzI
         x4Cw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790011484; x=1790616284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/v0KnOInrE/uxrVKcrgbiXLeViQuxHndnnvuHrKDtYE=;
        b=X9Gry/EKIR0oA3WvRxssW5CbY/4aLhKAvkvNN2Y5Yf+onpizzgG+z7nWeV0abPV1vi
         TnjAMogewj+QdGC+OGhLmEC8fQttHBvim8VPe4c71LSKQiU8oKC7pGbytCEUCUi2XJBz
         PMdftrvoZRpkH+PIvlOzLL/bEtaalWpJW5mYTA/Dy0XCmZ8VnWCylPUpMlr/RNBhP6OH
         /xxEVzCmgstuO+eA14QntGsrh5dKmuFcR6ftHLLhuFOFfoojUo78JA47WCybxu6RijgE
         UTQ697MYObZ4yl9ZtYv/PDmXJCJu7Xt5cB1yg2PYdxO5NSIj8484d6sBJqcGnN8SvXjY
         I9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790011484; x=1790616284;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/v0KnOInrE/uxrVKcrgbiXLeViQuxHndnnvuHrKDtYE=;
        b=ZvS1KeBkuxxKwnUD1h5CRcsatn7BCcqOX4tPWkIrsN16mXpY1N/qqHdujRt2ACppNn
         KhG+BSouCoQ9dWFZd2BzB98su5BBWQLYiHkHbpKLpJS4xPB2pTsJHUhCYxr/gyBIjIhe
         0sb9A4Jgfs8cdjU1l5bARA+i5eX3KyCQLbydNmqam1C9qd9DQomZjLCcndBo1OadP/yD
         7kMREdDLfQVVynxBPiKEPpgNjjj4jGqk3i3SxeBiqNDnGIxzIBiLJTnAkZHlufYgVtTQ
         dOxbatWTi31GbhTi20QnDKRCivPuvlEv/CQLOwCvFpc+wFlwHt0Jbip/WsOMtxe59WmK
         8I0Q==
X-Gm-Message-State: AFuF++nt2LDBxyN747jIWGewchLhkvVZBBb9Xbu9r5fJwDSImgj4P1Fl
	N5lYwm3HMZ+QjZGxjB3Wb0ceU4YdYRuc6g0nmDJOSAOtpdsq1Lfds88lBHnBAbVmYLIVq8iBhp5
	bqfAgKvpVQAN9/BOgZA2uW/RjiYyBDN2PlNnx5l1q
X-Gm-Gg: AYBFou0J9JFEMbuzM9dlXmnv+vLEYm8Pg8B+S+R8M22zuZoA8+NTjH7FFnUAmp6k0W5
	I38yTpd54EC3xB0sEmQF7sgtakXYeCNCUo3TwnJo2DMtosobe7mU+S9H/Lty15W1YhInre56A47
	+8fbKyQvXY3xSKHTT2Zdinras1MrR5iDFJAfkex5KnAXvad8cKXxnkaTRG7dqWHTxJ94ir4I1It
	FpV/IPk1AE25yJ4D3TYQejhf1tpvXwGKUzFbVHidVyBnXWJzlt4xnKzB+fFSakEpHr1ttIJCpGy
	OrpiftBJzAiOQe4BRejAHNhQ2Q79F09QIgkXs/43kq3JRHZi8FZ91jGSPPGoEuZcmkQhBZXjrXo
	upXbw/3Q86YV4kb2u0OTdjwW5Ey+EJQUcxz2XfXHl
X-Received: by 2002:a17:902:bb87:b0:2c7:f0cc:dafa with SMTP id
 d9443c01a7336-2df5a6593cemr125095ad.5.1790011483066; Mon, 21 Sep 2026
 10:24:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
Date: Mon, 21 Sep 2026 19:24:06 +0200
X-Gm-Features: AcwNN1U7svCPIdkwDP9pPf0HOHZjW_TisEKhV3E71X43wo60ibp0-Yv4z4MLOjc
Message-ID: <CAG48ez2N4jPTF7mqs28NHNNH+ev3xFqE+FJ2OgaehAw8L+w91w@mail.gmail.com>
Subject: HID: intended semantics around report buffer length?
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org
Cc: kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi!

I've noticed that some HID drivers seem to assume that HID events come
in buffers of at least HID_MIN_BUFFER_SIZE bytes for historical
reasons. As a random example, elo_raw_event() can pass the supplied
buffer to elo_process_data(), which can access data[1..7] without
checking the size parameter.

However, HID-BPF exposes the kfuncs hid_bpf_input_report() and
hid_bpf_try_input_report() which appear to allow BPF code to pass any
buffer with size >=1 into this codepath.

What is the intended API contract for buffers passed into
hid_driver::raw_event? Are HID drivers allowed to assume that these
buffers are always >=HID_MIN_BUFFER_SIZE bytes (in which case I think
HID-BPF probably has a bug), or are all HID drivers without explicit
size checks buggy?
