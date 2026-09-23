Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6006B56B878
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192067; cv=none; b=f3EtMvTzJ4jn/z1HiXRkHLVQRZzCqlLfe2aFod9nH/3wrKK7iMV1y4YORxfWDsLEwZY915O4ooQOQHEJajE57mVCx72I4ASUklCBfqgfN7jYtir+31SPDnK7bzwAo6tm/t2+OtnZjdk6PpV3punFdkuyZ0aN8TqhiogeBFTqS1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192067; c=relaxed/simple;
	bh=PB95bkR8q0xqzq5Jacy8pzAJbKlvGJzOjPiJJrp2vys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eXxXAta4sNuc2YTMI3aoxYv7DkSnIYxmLjVkgwxig1XDqDCPl5L1hMS5UOI9P3AvD09qWfovyrpYQKZrStVHWyYF6YXrCHeDMJgyIMTGTEIOn2dQo5J1BrzV2DaFoMRsi1ejnSbfmvU8S2paLJEFbIE3RVAWoikAcIkRU3drB8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N5FUZ56W; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HHHOG3H4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N5FUZ56W";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HHHOG3H4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790192064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIXvQ3GnvmhPwRTBSZG3po+BNh/ksNDKssG8uwTWus8=;
	b=N5FUZ56W1nthtg/mUzpjs7OKkj/lXnvlmNr0ji2T7YLxUX8ekCtotlS19dQL7CHhIsIRG1
	ZYzQlj3QTNETr7GD8AuvLdBoAblhPW9dcV8hzQzdkCdBXWTwX3PKrqSXXFTny0q8QccMwB
	J3cg20Id0NsfgrBJHEvBiQgSKr6yJEQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-DQ7eqoYwPNqIELF9bTEb6Q-1; Wed, 23 Sep 2026 15:34:22 -0400
X-MC-Unique: DQ7eqoYwPNqIELF9bTEb6Q-1
X-Mimecast-MFC-AGG-ID: DQ7eqoYwPNqIELF9bTEb6Q_1790192062
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cdc69a7b5so24119006d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790192062; x=1790796862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NIXvQ3GnvmhPwRTBSZG3po+BNh/ksNDKssG8uwTWus8=;
        b=HHHOG3H4Zr159ii67u/DIk3xOyJ4j1FGjWGTIrsp8YuX1P1btIkmeWWG089xlMBMwa
         BIRCEoXD3c5UCD57NPtzZRCUXO9oDV/3y/Z8Yb54jL6FATq24g8vFps2Dx04NNpEPxwE
         X4h/RE5X8No/r/o0IfOUC1vZHD3au1VIg25DeAnAl81l+y233n0zKlS4fOpczHYTMvmD
         H9xEfAVvvEYmz3PMfGBVVpzsXwajIJ5HYna4xTeE+JBu2iRSpLHqX4uKzReI4AmfW470
         rMZNkAcvlWhA8vIm0N5uz03nGNWlH1ewEQ9un/gpoyYuWHbF5WyOu/s2Io8HsZ6Nlvsi
         eMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790192062; x=1790796862;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NIXvQ3GnvmhPwRTBSZG3po+BNh/ksNDKssG8uwTWus8=;
        b=nuA3beg7pM198H8brLi/jXL+jIBe6B6VqXqqRgCxFQqidK6iwYBE5/awFYzcTOFJ+M
         c4WNX5y4BBs7/HwLrp9W7c0JBtUuReTL5lxlBcMCt970PAd5EH+CkfvUR+wp7u1QCVTV
         iqg0g4/uCJviBQ4S29fXz1pVq2JSUh5AldYbUCMRV7IFpp9o1ea8Gy4IyS9exwqkHqam
         Yus0ifdg5HjbRBNDOlHjvRm4F9KfFlDTlYfrfcRr9IOPEArBaSRZpHLH04Gk1ZfEfWW+
         0z39azSDHgDTFeYWjBZ1qlLtnyXYhB9CLlItuENjla3Enn7hoklaLM0HaYe7ctozxMG3
         9h7g==
X-Forwarded-Encrypted: i=1; AKwUvBx8KhQMccngwuD6kWzZ/pWxQpo5fYq+H8JkcYDjyS5pmZ3MGkoGfi9FqDWG4mTolPOreyvVpQyYGdgin2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++l5UuxeXUaydVa1vcELc//lSoXeYgD/+vl4DBRuGAgUvsYE5zHM
	VKVxmWVrlra62T4q3jJZLC+FxKxzbJfkpOy4jxHb6O9li0Pg3OUKWMwAYfncqnOsQQxG4vA7fax
	TpHFXe4oDJ5sWfGfhzbbdEYNJIpfEucjfQQxIBwmKpAOE0qLnp80r0uKgtRsVPaPE6w==
X-Gm-Gg: AYBFou3axJtPXzuBT5aeDvXafcoZNzHy7Ez21ZLzONlyPMJZOViPIYKxsvzYgLDIHAr
	DbUq7Cb0mo6TDQhj7a4uJcjz6PDIY/f4X+mEc8QKTK0BGZZLG2oC17fJqEd3RJf1jMYJM6Gi3hj
	XgmsO2QNemCcMQFCdPKCrPYUCCvtCexEEuRybRWWVqJQdtdhlg4/mLZRuxKIpQJGc0d+TJFBgpT
	DrqvoPsVJjh87r5OyzYva5qg+9jS+CTKdcsNl7Q8J6VmSg5zAQdtXjTG+Vx2o0I3HranlwX8McB
	zcDx4yGVifL7mj9egzYcGGI5bweEWx16iRzOOHoT7/JYWUSpA3O14M/tK4LixBwPGtk+0ZmbdaZ
	t2I10mxo=
X-Received: by 2002:a05:6214:5c08:b0:912:5c63:c401 with SMTP id 6a1803df08f44-9141e7d3cd7mr2405186d6.36.1790192062024;
        Wed, 23 Sep 2026 12:34:22 -0700 (PDT)
X-Received: by 2002:a05:6214:5c08:b0:912:5c63:c401 with SMTP id 6a1803df08f44-9141e7d3cd7mr2404576d6.36.1790192061413;
        Wed, 23 Sep 2026 12:34:21 -0700 (PDT)
Received: from [192.168.134.224] ([2600:382:8529:2779:5d36:56ab:46b2:2e62])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e0d44e7sm1828446d6.3.2026.09.23.12.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:34:20 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-clk@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260908225615.1732105-1-georgeandrout13@gmail.com>
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz`
 constructors
Message-Id: <179019195888.123225.14441141476200838196.b4-ty@b4>
Date: Wed, 23 Sep 2026 15:32:38 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=334; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=C0P714IC2ygMz1RepkhOWhkiEsy2CAigGu+y7aDcJtA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK2aG5S+8H3/n7Y8keXeSU+5E9Lu7RKM7Xo0gzz1PZrp
 66/6fG+0VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBELDYzMhz7vSdu0ynlU1/v
 L/NbM9/d+0ts2Vx+/4dJPHvXnPohFvic4Z/u3NTrP18/uL36zT6GTcLiBx+sqj/CVd7POUnjfMW
 tfVtYAA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 08 Sep 2026 18:56:15 -0400, Georgios Androutsopoulos wrote:
> rust: clk: document overflow panics in `Hertz` constructors

Applied, thanks!

[1/1] rust: clk: document overflow panics in `Hertz` constructors
      commit: 45a68afbd4b632538a0956ba783fca45b8ceb446

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

