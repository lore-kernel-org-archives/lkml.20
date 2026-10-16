Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74FD4CE663
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157434; cv=none; b=F0vi8LZ4E0yuqksviNufsEKyrownBs6uphlCnEOZFygxF5sHe4adNt4OcvaQfWl17p1WGDIGfDYyTercjmk053jL3/SSewmTFaItob7dyG/447xaT2rXU+DWCGHVjxh3ne56tClBDVIasGDZsfMRWAXmSxF9IeeRVNS4bI+GILw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157434; c=relaxed/simple;
	bh=VdGSNwvOHS4tbe2yVTH2LkOvCQHy/DauMn+6yQ5pPyE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=S1atDoU1a7avref/VQrV39zMj1WouZXtJqIwsfBejcD+yYMaJ9m0i//S4Cwl4FWB2Z5+olsrPvopDBze3E0eRfrDny5EajcSNH8xHLstFsVDlY6gt236N9j+3NJKEegmi0ay8CGUN+eFYTxxi1TPfYXNJ8Yzje1R76LMp2eLPho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MSyPGM/I; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MSyPGM/I"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a178080182so7738124a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792157428; x=1792762228; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=38bbwGsSQzV2CEajfwFdc0TQEC0G5ZgW+cODzujfzU8=;
        b=MSyPGM/IUieJ1N9gtdWYnhzo5eHYEMfCGkg9KtHGOVCcXkpxGsbTHJgpwwXKpDkrCf
         b+DUJT8tPxCPjSKDZM96uVHcn7Ysc4pzbayxQYlfS5Boq2MPDA7704Rv2hpuZjfR4yZm
         eTOrtCLYz0Mvaaw6ubJ7ZGVxIldsOVNDiOwBz3Aq3AekCw288L7K6tEdhPiUoLpuw6+w
         oRitofjNcH17+6IudT9OFkbCbO5jgf9t2yT46xKVKd4R5y1kuHCtmbjBDzWz1Bpb7n9m
         +VMkMTkUWArhhWD5WDy8lBd9I++aq6ZqZ2KaFIP7p6DJGsbLrPl/vRdoEYmdCMaeEx8a
         9mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157428; x=1792762228;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38bbwGsSQzV2CEajfwFdc0TQEC0G5ZgW+cODzujfzU8=;
        b=xdWO2vUtnW/jef7cwZcDN6TId+lDtxkeEytwWTqUJHgJlwP8jJoNH7jWyyIRitiDoo
         8zN1+otuxw+e69MCvhymJqxhPGVdcn3bZCHiJU4B8GTC5XO8r7lhzjKXHY0r9mGpqqwa
         JwO8bcgTogXPKEv8iscefoHhuPvXIGsnHu5+sZX6/ElsFeiz4kzaKPYT//AeSrWUW7nC
         neKp9MMWHiqKj4aKbB5Jq4yKZ1KOBN9lzv6a91tboB8o5dpEr8lXfygYKXGVwhSFQ0i0
         uB9wYgxofmUdKalz/RlwWTYW8b+8gjy96NxSnJOCfKt8CpX/1huxDAGzCjoW76+FUOVl
         Wbhg==
X-Forwarded-Encrypted: i=1; AKwUvBwro3lP0DGDNOu7qI39pO7XtZlSQzcm/s+BckVR9B+q6IhuG4cdubxjxmzsfvO7TR2AXXps8h9ozv0amk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5tUjLdKlGVjwRP+KE6fnVnlCxEUSpLq3i86kmlWeXF4Vwy54C
	ZrC45ht6NqpV5bGvDq8cvomtCnu8s+AY/zFGxCSaEwLHcE2q+JgR1bboWdfZ+MnzIkmNm7mD8x2
	rRUtMIZCx1RAnbLonIQ==
X-Received: from edbbe25.prod.google.com ([2002:a05:6402:1a39:b0:6b1:d06e:c413])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1cc4:b0:6ac:8dce:5a86 with SMTP id 4fb4d7f45d1cf-6b17c257af1mr18581683a12.23.1792157427717;
 Fri, 16 Oct 2026 06:30:27 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:30:15 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOcm0moC/x3MQQqAIBBA0avIrBNUJLKrRIvU0WahhUIE4t2Tl
 m/xf4OKhbDCyhoUfKjSlQfkxMCdR47IyQ+DEmqWQmpuKXssPGFykVutnDVBCrN4GMldMND777a 99w8wqDVzXgAAAA==
X-Change-Id: 20261014-binder-memcg-b42cb9f1098d
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=897; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=VdGSNwvOHS4tbe2yVTH2LkOvCQHy/DauMn+6yQ5pPyE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq0ibtYNvqiedt02F19Xor2K0bMRzbl1S9CHsPm
 jXYYOrb/fuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatIm7QAKCRAEWL7uWMY5
 RjboEACMnNKyBE64K0GQYb2U/3ziHnVZKrSyF1FRxjJgNj9kH7uTZQ8ppQqBLuwdtyzRUe4TgJb
 WyCVeLSpXbpIZCLnnPjB+wxyUFZRReR9sB+q+FzXkMWJjvZOXh9MKKuw1Akc7ilP3YdYxCynYFy
 Qnch1TKxg8vw1+GxPE8q299F+S8EEEc7Yu8Qua7u1C7qzIF1AgOW7VeIl7E7P+tYiChWkFwwmMC
 /DoenxAlslhnK7HJnHDga/SV7bYToQDjsQ2JuBRNQQvo9P1QWSWi7YVlga6uVqS1ZjIcDWCaJss
 6AMv/CTO3zLd9W4gwckIc28DhalM9zEECBodjRbAEAxYxZ/oqLcv94qeQ2Din3jYiubHpz+dDem
 2WgrO/KrUfiCdhz/YwLzA4ls1WyvxX3fZqebb+/rbHQpthzSAECFtFbplXu91dgVlIKxaIp2U0C
 HdfjvhyM+PP8X+J9043uO5n3eZZQxy6xp4XzpSYEmp+V8AhSd4pK5CH3tmomiqYOLQLAfjxNu4R
 mkqSO7aUgvvXYDGIcoUXq5zL/DlWdJGdJqZyMiyqAhbE6I+xV9v8l8AcjbX4e4dLJaV/0CyaEOU
 5eW86eEKY59W4YFIxyl+xyWK1smF5Fkk7mwciIw4gL3xiCg+kWh7VOy5M5RVxpFeGHGAOWVQ/zt yITc7uqoXonPx/Q==
X-Mailer: b4 0.14.3
Message-ID: <20261016-binder-memcg-v1-0-d659b8ae088b@google.com>
Subject: [PATCH 0/2] rust_binder: charge allocated pages to memcg
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"T.J. Mercier" <tjmercier@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Pages allocated by the Rust Binder driver and mapped into a process's
VMA are currently not accounted to any memory cgroup. Add
`Page::alloc_page_memcg()` (using `put_page()` on drop so folios are
uncharged when freed), and use it to charge newly allocated binder pages
to the target process's `mm_struct`.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (2):
      rust: page: add Page::alloc_page_memcg()
      rust_binder: charge allocated pages to memcg

 drivers/android/binder/page_range.rs | 13 ++++++++--
 rust/helpers/page.c                  | 17 ++++++++++++
 rust/kernel/page.rs                  | 50 +++++++++++++++++++++++++++++++++++-
 3 files changed, 77 insertions(+), 3 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20261014-binder-memcg-b42cb9f1098d

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

