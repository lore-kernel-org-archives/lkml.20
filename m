Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89D830D41C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788153298; cv=none; b=pJXJzqUVvILbISFAHlnHTCBFwg3LziM2FyuoigmPiPK8b6wNFWOAG3+oG9SBQZieu//Ziq/JztBanwPZO7D/OorWOpYUWZmHTGH5fbyps8048VBQufY6P3pPuCsqDlQhkuMnBYyXTH6OyXFsQ9BLFxIrVoWbhKJUE/sJkcmpfKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788153298; c=relaxed/simple;
	bh=ruA8iuvJdam2XhfBnkvuly5gyU9q4XheOj+XBbK0NMw=;
	h=MIME-Version:Message-ID:Date:Subject:From:To:Content-Type; b=bESVFnmDbHwWI2IsPW+69CY2grW0BoNp+XascVdxmbms17tCCZ3xG4lnD+Vm/1MCqmv8If0cl/v0u9QBlrxXyfcQ05IBphJC2avTySHs25yB6CpE/OH1QYRh3frW4bs+Z4ewn5k3D45bzepi5Uc1c8kg4AteNv/21Hy6dpif0m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vwb+hV/Z; arc=none smtp.client-ip=209.85.128.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vwb+hV/Z"
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-836c89e6ab0so48942037b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788153296; x=1788758096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:from:subject:date
         :message-id:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruA8iuvJdam2XhfBnkvuly5gyU9q4XheOj+XBbK0NMw=;
        b=Vwb+hV/Z1CYDWoFKtBj7kq4HpmAxFnE0oMr1BJ786guihu3ufnTxaIhAcLpi68iMeO
         wmITnlGAu/nPnAAv0EDFKm4dQ1kzo4+Z8cn+TJhXYKNdFdrf8bt3X7g2AssI0qZWio9p
         u18vJMDuHffEEcXZFsUq0WMDl8vBafxre+hIHMt1PDGGyMLIiY8h+qEV9xo8ZbvUTmk8
         KJao7Q2ZvTMu7hWuNNDxWPgTBnguuuhqrbMdWdGuQnsqgzqwj4Arn2QyL4q+Ag6YRNfg
         FgwMgBw+dl1T4F3v0id9uqvJzqk8ejIODDzX96v6Ptk4pVTgKhTm5BBacpU7VO/M94av
         zAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788153296; x=1788758096;
        h=content-transfer-encoding:content-type:to:from:subject:date
         :message-id:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ruA8iuvJdam2XhfBnkvuly5gyU9q4XheOj+XBbK0NMw=;
        b=iV8pZfhnsZbrbEMPIitwQj9Qm3y3wqZxxaDh27I0ha9IjHQgrrMnr0icFmR8xpPQ0A
         GRtep77/zzManBZgf6zD15/uApQf4vmrIiDfaY0t06M+Imy3g1Dc9lK3Wf0naC8Fd2Fm
         oVqXjN6bSZCQAuOvcPc9AjUCqLOlGyj/r1AzJFUHka9ZY9Cs7PHJPZjF91s8h3jjF8UF
         D07rB9WsAmzgBf5pxh3Hfw9y1JHm7bIoF58UCovlOdOrNdTlhq8M0oteWxKarFd3kmET
         rq0ZbrALU1J6jeHrUvkYUSi/EL2FT4f+rSBiSqcyWPkVZx/k6ebtu0UFoOaaEr09cFyo
         rRRA==
X-Gm-Message-State: AFuF++ks1bVx93H9NKbxNJeFY1LGTgFVXb14FzQlTBzeQSM0/cb4LNhc
	czyo8bfobiw8pFX9fNtV7ZxWJBE9ckd1CCioF9siT2QqFwBiQZ5kjE0JZiksP/xv4C+exbBnJKp
	NFvI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:690e:418f:b0:66e:56fe:e178 with SMTP id
 956f58d0204a3-66e56fee3d7mr4238378d50.17.1788153295857; Sun, 30 Aug 2026
 22:14:55 -0700 (PDT)
Message-ID: <autogen-java-8f67c07a-d11c-4af9-976f-4c02e2a124f0@google.com>
Date: Mon, 31 Aug 2026 05:14:55 +0000
Subject: linux-kernel@vger.kernel.org
From: kanchansinghu74@gmail.com
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkkgY2FtZSBhY3Jvc3MgeW91ciBidXNpbmVzcyBvbmxpbmUgYW5kIG5vdGljZWQg
dGhhdCB5b3VyIHdlYnNpdGUgY291bGQgYmUgIA0KaW1wcm92ZWQgdG8gYXR0cmFjdCBtb3JlIGN1
c3RvbWVycy4NCg0KSSBoZWxwIGJ1c2luZXNzZXMgYnVpbGQgbW9kZXJuIHdlYnNpdGVzIHRoYXQ6
DQrigKIgbG9hZCBmYXN0ZXINCuKAoiBsb29rIHByb2Zlc3Npb25hbA0K4oCiIGdlbmVyYXRlIG1v
cmUgbGVhZHMNCg0KSWYgeW91IHdhbnQsIEkgY2FuIHNoYXJlIGEgZmV3IGltcHJvdmVtZW50IGlk
ZWFzIGZvciB5b3VyIHdlYnNpdGUuDQoNCkxldCBtZSBrbm93IGlmIHlvdSdyZSBpbnRlcmVzdGVk
Lg0KDQpCZXN0IHJlZ2FyZHMsDQpLYW5jaGFuIFNpbmdoDQpXZWIgRGV2ZWxvcGVyDQo=
