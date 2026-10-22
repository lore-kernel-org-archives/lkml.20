Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702264;
	b=ptSwRF+2ne2wTd3+Sbae3MZscCA3hkcoxoMZ+/pFq+HUufMTZ8LgRGbmRoh5+cZHBMOt
	 BJrjQ1OPIvQLjfOmNyfxOfPpkfdmAX5kCaAO/Pj/4bcq/DzJrFv74RDzYlS+Qm8VehLw6
	 WjLaJX4zGXlWXMNa8kmqen1ITGs0md9MugwLLXbuMm7Fy63mQefjhpXBUOV3Ysw2KRUpz
	 N4qi0Fop7/4gwacsUO5zXjWgdBTOcvhI/8uKxj2rQk2kWmHKWKui01ILTFJGegi6TRzz6
	 T7dyHzsmNoZeOaGKtr5ThhAK39nmEsKDKrH5J1XnTg2fdnGNQL6iMDc/+tQLptYrCyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yzKfe/HIkfkdztp3Uz7ZvCiWpLjrHeTj8pQ7u7u4b7g=;
	b=uSjICy/HVcM2fTBRW7AdAITtvlxqMgrAfeTT22TgtwtJaU+2KmUpuVIpprys1rngYuZy
	 1gYD3pT3vGOJMTz6e3mv8HPVZfiHoTMeL7NiFJYBWvxcXKapMYjDkHSZQ4v5Z8MuU5vtF
	 aLm4DSr5FWwjc9hVtRB1TPzW0SwnB+7v28hs/ekHl8t86cN3RoQ7dZL/KFJOXDmMvl+Zs
	 a3hBTjsUW1tNKgwjq1P2gDxWs8BHjroZh5z6oMXfUSYiqaJGB7APIYkCq1D9DnLaMg2iF
	 7F8Z4KiyqH8mPeSN8zwOjEX0Am4+meu4n1z7XmLjv0+LzV01tOFPmvpPhG47M9bdZ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=omDFPABZ;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241DB606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 241DB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=omDFPABZ
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso37876166b.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702261; x=1793307061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzKfe/HIkfkdztp3Uz7ZvCiWpLjrHeTj8pQ7u7u4b7g=;
        b=omDFPABZWukNshfcvKsiAfrd5oEwJzH92xrxWZfyaxZT87hQuuvMlXKLnDRDKgUo68
         C687Ocg8hgOdeFsVYpvaLK7qc3vT7yod2iXu3Yh8iI1a1pXcb/xaQ2z5ShwQ5elPU59/
         0cR2ftqTCpoVQKKyg+pjRrIU/UCAx47Ju9Ls1R0yubnoGA90oYnKjGgK5HMBzyVVJNtU
         o/KKMcLmyZZ4zmrjnL8NQ7AEpYUB8nCkBnrQ/eTB5xNIpIGgBeTxeY5p1doKvmboCNr3
         o0IiLb/7eTirYlQmUmAn0+nG8dyjyX0IF52mJTmKuEeioyHDw7I/UJXyfxVxKr8cM3B8
         TeNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702261; x=1793307061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzKfe/HIkfkdztp3Uz7ZvCiWpLjrHeTj8pQ7u7u4b7g=;
        b=knkoJ8edpO2IIeGUzffZ7p2fjWuNCPy7eJr8CwRLzfYsNuAR2bVUisC12ltWzW8bsY
         I/Kah/vUvqqocgA6YuiobrSnuwcK/C6UdwixhUbxcU++Psimt2bOWXkAiWJFui5sXohP
         mVS4evKIXMLFrxYmqz0davHx+UAIWbtqT3T0CHeum0R97L2Lh5Fbq3Xa7FYLp9xQ73qC
         DAXJqNPMQFsrJ8YROWS5MO6fZfBKR3+/bNlBYd948eBlolHkopbYv/PAvsEDpKQUVzwY
         8onaKYAKXMjCX61b883rubiX0hkcwZeiFyRf7o404TYYdwzURjghoF7i3558pV7Ajt3c
         pRLg==
X-Forwarded-Encrypted: i=1; AKwUvBzfAiBS6jGpthaZT6cdJuME4SHyme8J5g98/3Pb9uayXM0KWWZZJJZ+ax4WvNbHQXVOicSmxsGjgx26qi8=@vger.kernel.org
X-Gm-Message-State: AFq9FYITXBQKMQ2r1Ae1zeQfBEPE4uLZDdfe+Eeg5gZWl3ugnBCOA1PT
	cnzn62AK3YOURHuj7G5km47/vlVKOzlwxH/hQRERQAOwORcsXR/mC79I
X-Gm-Gg: AYBFou0ez0Hi5zLisC462o6q3txb4AVYbW8tsJ1lm0C7GmyHBZuKPF0ebItsi/KmBLq
	/jS8kXPI95tsaaLu9mvCGOaGseRCebm47BTTJ/S0LSRgVaaqe6BXPDthbpjKro91UAavoBLDrbL
	mOIGdKZWSKtA0fnaMqgHtxBJUrOTw7KlCN/Z6031QFTHQhZmlVKpuwwBtHml2hA3HuqgGYmnWhj
	Y4SQvp1iBbFyQd6K0x6meyx9F+R4tkFWJkLh99a5sY/kbORDtaiPSOcX488E7Y7k8uwBrrOHqrL
	qIB6fD6zE1tw/y5l0iMLJoEWw0OayGj+pTkobpZBoQ5VGX9LLI8VzcA6Z1PwdoTA3biCjy0vW6e
	0PbQVSRwiin+5d7ROD0CkQeAjUv9wNcTOAYwjtUSDRAXramtPh09S0R6ogy/JwpWoaR+jJS+BXv
	CzJ8lrDZ7uUI/1VPQvnelx+wC2QG76lcUhbgCCj18ME8ac+AnuuzZMAKz1VjH9r9uYd198FCLlo
	JbWpM3+JtG9GxwVCdVc2Oy3LDsxA6ExMNuD0e1Q/f8Z6Tlw9lV8zy/9M/myWvsNiTU9QVaMxhXa
	vdz9zCSKjpwwEdw552/kmwQn+xIvuCfmNIJJF33ma7/VPavxMC31ksXbhrJXrACfV++jD7/ZXMk
	VyFDlmVpGnVYXrKeAgyLjP7PS8jgg9Eccb6hLqIeUvSrPCr73eedVqQo/+w==
X-Received: by 2002:a17:907:3dab:b0:c2e:3b23:1468 with SMTP id a640c23a62f3a-c46a94b7c7amr47733066b.48.1792702261240;
        Thu, 22 Oct 2026 13:51:01 -0700 (PDT)
Received: from martin-Virtual-Machine.mshome.net (h-98-128-181-228.NA.cust.bahnhof.se. [98.128.181.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c4d518sm28898066b.17.2026.10.22.13.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:51:00 -0700 (PDT)
From: Martin Nordholts <enselic@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: Martin Nordholts <enselic@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nikolai Grlica <nikolai@nikolaigrlica.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: list: Improve `List::remove()` SAFETY comments (and remove TODO)
Date: Thu, 22 Oct 2026 22:49:23 +0200
Message-ID: <20261022204924.230453-1-enselic@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

See the comments themselves for more details.

Signed-off-by: Martin Nordholts <enselic@gmail.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/351
---
 rust/kernel/list.rs | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 0f367264ee2e..24f2896feff2 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -599,11 +599,12 @@ pub fn pop_front(&mut self) -> Option<ListArc<T, ID>> {
     ///
     /// `item` must not be in a different linked list (with the same id).
     pub unsafe fn remove(&mut self, item: &T) -> Option<ListArc<T, ID>> {
-        // SAFETY: TODO.
+        // SAFETY: The user provided a reference, and references are never dangling. Additionally,
+        // our pointer will not outlive the lifetime of the reference.
         let mut item = unsafe { ListLinks::fields(T::view_links(item)) };
-        // SAFETY: The user provided a reference, and reference are never dangling.
+        // SAFETY: The raw pointer is valid because we just derived it from a reference.
         //
-        // As for why this is not a data race, there are two cases:
+        // As for why deferencing is not a data race, there are two cases:
         //
         //  * If `item` is not in any list, then these fields are read-only and null.
         //  * If `item` is in this list, then we have exclusive access to these fields since we
@@ -628,6 +629,7 @@ pub unsafe fn remove(&mut self, item: &T) -> Option<ListArc<T, ID>> {
 
             // SAFETY: We just checked that `item` is in a list, so the caller guarantees that it
             // is in this list. The pointers are in the right order.
+            // Mutating `&T` is ok, links are behind `UnsafeCell` (in `Opaque` in `ListLinks`).
             Some(unsafe { self.remove_internal_inner(item, next, prev) })
         } else {
             None
-- 
2.53.0

