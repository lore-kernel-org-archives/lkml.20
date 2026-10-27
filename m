Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793065081;
	b=whUyLepaPBi+1VXGb+xZbHoEL6tvTe2D9TnMr3EjBeSBKS+besRziHIqOXEOrusdgWmf
	 +YIANiF2LnJBd6DYeVYGCKjhuunnsfxZYCWidZwVpccQHdbA3ezoB7bq0fCkV8R5VW5rE
	 qsVrY0y7H0mdWYTteodcIfwXJW+8Yz9+67J/uZa8O+Zv6ez4IxyeUzfYz/iMs0JBykVOb
	 WiqqJgEuFy3MwnSFNYNFF+rrWjk6CAsT8XnV0uAWm2oVD52gQbE7Zhwy7DCW1Jf2MY2yq
	 WTwrzdFnuKcL7b+loRcaM91x4ST/ll6IuNGDhrFtZHW9/Iq0rUeNmuXsn1wBfKN989g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793065081;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=M5mYU3riCfJzG02ksxwCWFh5lA82jidfKeFRiSc1HOQ=;
	b=IiYaZqiSww2mGFZm/rh+V/+Mzp4e5IektRAEufuB50Iu6RP9C86+0Dxg6FGKUOk7ylQy
	 DgmGD3qJk07zTmntZKbHn1d953OSAHe+WK8ByFRJTDc4GoPsUcSP3dM9reGCZjDrTqF01
	 mbCv3Ro7GycjJblEr/pUiuCvsitSaxQt9VKASwQ1poc2Rv6on86sUZXWDnacavlhCm4Ts
	 3LbVrlivHBQ1MNLsPmIRKz7mKmDv2GPIDWMCGn3Q/aJT62dIafdCN77SQZyT6XF/I2oAe
	 q9yHz18XjEL/3HlK23YxBE/oYIiD+FspOCBKgch436qc2AJxzxT5McpA4P5oW0w5O1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dg5qQZLJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE69606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dg5qQZLJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF791F01828
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793065080;
	bh=M5mYU3riCfJzG02ksxwCWFh5lA82jidfKeFRiSc1HOQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Dg5qQZLJ4TbbiLgbRn5/Dm7NuTneW3+zbRBHWjxd6VVxrU9C38vrr0nrIrbZ0fwjh
	 z7/lhagEDGtjB1WuUkhYLf0+JwSC+L9TK2o6BWoUjysYsJlmwxU+fc42fURD09QAIJ
	 ieK5eNySU7YLw+UNPSgpJ2gl6ehQWufooV82pVP2tpVod/WPFqN5ebaDiND3LZ46xg
	 MiZkpQ4oCBV7brrhzhyhp0ZrYm6maFz2dJgpbl/TbVR0YOpB8dX/VG7UHoLlEh9WfY
	 E3DGekcnQVVFpq9SQnotoNN22MUem35KI8wvhByVINZMdY+Oh44+1TebOHS1h5oaS3
	 q5yFUgfuRCyig==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c37b612635bso474060866b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwK8XWUdDAzz7SQqjVy/r935wQNfkRl2hLG2txE6zuTfV8BY1VuGPwpS+THophSLJ+tEUcyfi4uIHXu5e0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnEDZGkc6FkzraybSMWp/973tagftVMW94Vn9b4wjZHXBo/NSQ
	dCxG+VFLFqqxlfcSFlMxflTMY/XXhBZV3QCmdaZiXvMZWHUUqOX/5BpLqz+47UKzyLzUGPQr/o8
	iEel9oK1AuF2H3HNzQ8duIqd6u00x+q4=
X-Received: by 2002:a17:906:f5a4:b0:c29:5b0c:1b44 with SMTP id
 a640c23a62f3a-c46bde8ad37mr965654066b.37.1793065079097; Mon, 26 Oct 2026
 18:37:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026222600.17323-1-pali@kernel.org> <20261026222600.17323-9-pali@kernel.org>
In-Reply-To: <20261026222600.17323-9-pali@kernel.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 27 Oct 2026 10:37:45 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-hQXxBLxLQ_dr5omw-_xgL+96fNYfgW_poAihXYqDxmA@mail.gmail.com>
X-Gm-Features: AclHuK8xxk3NspBGCQrz3QE_Aizy7725rlPhHrQicRdhI-VMU_wWIO49qnqSiHs
Message-ID: <CAKYAXd-hQXxBLxLQ_dr5omw-_xgL+96fNYfgW_poAihXYqDxmA@mail.gmail.com>
Subject: Re: [PATCH v7.3 8/9] cifs: Add support for parsing WSL symlinks in
 version 1 format
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>  static int parse_reparse_wsl_symlink(struct reparse_wsl_symlink_data_buffer *buf,
> +                                    unsigned int xid,
> +                                    struct cifs_tcon *tcon,
>                                      struct cifs_sb_info *cifs_sb,
> +                                    const char *full_path,
>                                      struct cifs_open_info_data *data)
>  {
>         int len = le16_to_cpu(buf->ReparseDataLength);
>         int data_offset = offsetof(typeof(*buf), Target) - offsetof(typeof(*buf), Version);
> -       int symname_utf8_len;
> +       bool free_symname_utf8 = false;
> +       struct cifs_open_parms oparms;
> +       struct cifs_io_parms io_parms;
> +       unsigned int symname_utf8_len;
> +       char *symname_utf8 = NULL;
>         __le16 *symname_utf16;
>         int symname_utf16_len;
> +       struct cifs_fid fid;
> +       u64 file_size;
> +       __u32 oplock;
> +       int buf_type;
> +       int rc = 0;
>
> -       if (len <= data_offset) {
> +       if (len < data_offset) {
>                 cifs_dbg(VFS, "srv returned malformed wsl symlink buffer\n");
> -               return smb_EIO2(smb_eio_trace_reparse_wsl_symbuf,
> +               rc = smb_EIO2(smb_eio_trace_reparse_wsl_symbuf,
>                                 len, data_offset);
> +               goto out;
>         }
>
> -       /* MS-FSCC 2.1.2.7 defines layout of the Target field only for Version 2. */
>         u32 version = le32_to_cpu(buf->Version);
> +       switch (version) {
> +       case 1:
> +               /*
> +                * Layout version 1 stores the symlink target in the data section of
> +                * the file encoded in UTF-8 without trailing null-term byte.
> +                */
> +
> +               file_size = data->contains_posix_file_info ?
> +                       le64_to_cpu(data->posix_fi.EndOfFile) :
> +                       le64_to_cpu(data->fi.EndOfFile);
> +
> +               free_symname_utf8 = true;
> +               symname_utf8_len = file_size;
> +               symname_utf8 = kmalloc(symname_utf8_len, GFP_KERNEL);
> +               if (!symname_utf8) {
> +                       rc = -ENOMEM;
> +                       goto out;
> +               }
> +
> +               oparms = CIFS_OPARMS(cifs_sb, tcon, full_path, FILE_READ_DATA,
> +                                    FILE_OPEN, CREATE_NOT_DIR | OPEN_REPARSE_POINT,
> +                                    ACL_NO_MODE);
> +               oparms.fid = &fid;
Should we pass initialized fid to ->open()? When SMB2/3 leasing is
enabled, the open path copies fid->lease_key into the outgoing CREATE
request, potentially disclosing 16 bytes of stale stack data to the
server ?
So, how about updating it like this ?

struct cifs_fid fid = {};
...
if (tcon->ses->server->ops->new_lease_key)
    tcon->ses->server->ops->new_lease_key(&fid);



> +               oplock = tcon->ses->server->oplocks ? REQ_OPLOCK : 0;
> +               rc = tcon->ses->server->ops->open(xid, &oparms, &oplock, NULL);
> +               if (rc)
> +                       goto out;
> +
> +               buf_type = CIFS_NO_BUFFER;
> +               io_parms = (struct cifs_io_parms) {
> +                       .pid = current->tgid,
> +                       .tcon = tcon,
> +                       .offset = 0,
> +                       .length = symname_utf8_len,
> +               };
> +               rc = tcon->ses->server->ops->sync_read(xid, &fid, &io_parms,
> +                                                      &symname_utf8_len,
> +                                                      &symname_utf8,
> +                                                      &buf_type);
> +               if (!rc && symname_utf8_len != file_size)
> +                       rc = -EIO;
>
> -       if (version != 2) {
> +               tcon->ses->server->ops->close(xid, tcon, &fid);
> +
> +               if (rc) {
> +                       cifs_dbg(VFS, "cannot read wsl symlink target location: %d\n", rc);
> +                       goto out;
> +               }
> +
> +               break;
> +       case 2:
> +               /*
> +                * Layout version 2 stores the symlink target in the reparse buffer
> +                * field Target encoded in UTF-8 without trailing null-term byte.
> +                */
> +               symname_utf8_len = len - data_offset;
> +               symname_utf8 = buf->Target;
> +               break;
> +       default:
>                 cifs_dbg(VFS, "srv returned unsupported wsl symlink version %u\n", version);
>                 return smb_EIO1(smb_eio_trace_reparse_wsl_ver, version);
>         }
>
> -       /* Target for Version 2 is in UTF-8 but without trailing null-term byte */
> -       symname_utf8_len = len - data_offset;
> +       if (symname_utf8_len == 0) {
> +               cifs_dbg(VFS, "srv returned empty wsl symlink target location\n");
> +               rc = -EIO;
> +               goto out;
> +       }
> +
>         /*
>          * Check that buffer does not contain null byte
>          * because Linux cannot process symlink with null byte.
>          */
> -       size_t ulen = strnlen(buf->Target, symname_utf8_len);
> +       size_t ulen = strnlen(symname_utf8, symname_utf8_len);
>
>         if (ulen != symname_utf8_len) {
>                 cifs_dbg(VFS, "srv returned null byte in wsl symlink target location\n");
> -               return smb_EIO2(smb_eio_trace_reparse_wsl_ver,
> +               rc = smb_EIO2(smb_eio_trace_reparse_wsl_ver,
>                                 ulen, symname_utf8_len);
> +               goto out;
>         }
>         symname_utf16 = kzalloc(symname_utf8_len * 2, GFP_KERNEL);
> -       if (!symname_utf16)
> -               return -ENOMEM;
> -       symname_utf16_len = utf8s_to_utf16s(buf->Target, symname_utf8_len,
> +       if (!symname_utf16) {
> +               rc = -ENOMEM;
> +               goto out;
> +       }
> +       symname_utf16_len = utf8s_to_utf16s(symname_utf8, symname_utf8_len,
>                                             UTF16_LITTLE_ENDIAN,
>                                             (wchar_t *) symname_utf16, symname_utf8_len * 2);
>         if (symname_utf16_len < 0) {
>                 kfree(symname_utf16);
> -               return symname_utf16_len;
> +               rc = symname_utf16_len;
> +               goto out;
>         }
>         symname_utf16_len *= 2; /* utf8s_to_utf16s() returns number of u16 items, not byte length */
>
> @@ -1123,14 +1200,23 @@ static int parse_reparse_wsl_symlink(struct reparse_wsl_symlink_data_buffer *buf
>                                                        symname_utf16_len, true,
>                                                        cifs_sb->local_nls);
>         kfree(symname_utf16);
> -       if (!data->symlink_target)
> -               return -ENOMEM;
> +       if (!data->symlink_target) {
> +               rc = -ENOMEM;
> +               goto out;
> +       }
>
> -       return 0;
> +out:
> +       if (free_symname_utf8)
> +               kfree(symname_utf8);
> +
> +       return rc;
>  }
>
>  int parse_reparse_point(struct reparse_data_buffer *buf,
> -                       u32 plen, struct cifs_sb_info *cifs_sb,
> +                       u32 plen,
> +                       unsigned int xid,
> +                       struct cifs_tcon *tcon,
> +                       struct cifs_sb_info *cifs_sb,
>                         const char *full_path,
>                         struct cifs_open_info_data *data)
>  {
> @@ -1148,7 +1234,7 @@ int parse_reparse_point(struct reparse_data_buffer *buf,
>         case IO_REPARSE_TAG_LX_SYMLINK:
>                 return parse_reparse_wsl_symlink(
>                         (struct reparse_wsl_symlink_data_buffer *)buf,
> -                       cifs_sb, data);
> +                       xid, tcon, cifs_sb, full_path, data);
>         case IO_REPARSE_TAG_AF_UNIX:
>         case IO_REPARSE_TAG_LX_FIFO:
>         case IO_REPARSE_TAG_LX_CHR:
> diff --git a/fs/smb/common/fscc.h b/fs/smb/common/fscc.h
> index e46d3379b779..dee4fb6af16a 100644
> --- a/fs/smb/common/fscc.h
> +++ b/fs/smb/common/fscc.h
> @@ -69,12 +69,13 @@ struct reparse_nfs_data_buffer {
>         __u8    DataBuffer[];
>  } __packed;
>
> -/* For IO_REPARSE_TAG_LX_SYMLINK - see MS-FSCC 2.1.2.7 */
> +/* For IO_REPARSE_TAG_LX_SYMLINK - see MS-FSCC 2.1.2.7 and
> + * https://github.com/microsoft/WSL/blob/2.5.8/test/windows/DrvFsTests.cpp#L775-L815 */
>  struct reparse_wsl_symlink_data_buffer {
>         __le32  ReparseTag;
>         __le16  ReparseDataLength;
>         __u16   Reserved;
> -       __le32  Version; /* Always 2 */
> +       __le32  Version; /* 1 - stores symlink path in file data section; 2 - stores symlink path in Target[] field */
>         __u8    Target[]; /* Variable Length UTF-8 string without nul-term */
>  } __packed;
>
> --
> 2.20.1
>
